import Consts
@Library("devops-delivery@master") _
import AppConfiguration

// Call from file app_deploy_job.groovy
node('master') {

    //def props = readProperties file: 'src/config.properties'
    def app = params.application
    def version = params.version
    def projectType = params.projectType
    def deployAs = params.deployAs
    def domain = params.domain
    def artifactJar = AppConfiguration.getArtifactJar(app)
    def branch = params.branch
    def repository = AppConfiguration.isSnapshot(branch) ? Consts.snapshotRepository : Consts.releaseRepository
    if (deployAs == Consts.deployAsRpm) {
        repository = AppConfiguration.isSnapshot(branch) ? Consts.rpmSnapshotRepositorySearch : Consts.rpmRepositorySearch
    }
    def telegramNotify = params.telegramNotify
    def telegramChatId = params.telegramChatId
    def archive


    println "Deploy task begin. Parameters: $app $version $domain $branch $projectType"
    if (!app || !version || !domain || !branch || !projectType) {
        println "Update version failed.: $app $version $domain $branch"
        currentBuild.result = 'FAILURE'
        currentBuild.description = 'Params missing'
        return
    }

    try {
        deleteDir()

        /*stage('checkout configs') {
            git (url: Consts.gitApplicationConfigs, branch: 'master', credentialsId: Consts.mp3DeployerCredential)
        }*/

        stage('checkout') {

            def url = "${Consts.nexusUrl}/service/rest/v1/search?repository=${repository}&name=${app}"
            process = ["curl", "-u", "${Consts.nexusCredentials}", "-k", "-X", "GET", "-H", "Accept: application/json", "${url}"]
            println "CRED: ${Consts.nexusCredentials} AND URL: ${url}"

            def initialSize = 4096
            def out = new ByteArrayOutputStream(initialSize)
            def err = new ByteArrayOutputStream(initialSize)
            def proc = process.execute()
            proc.consumeProcessOutput(out, err)
            proc.waitFor()

            data = new groovy.json.JsonSlurperClassic().parseText(out.toString()).items
            def downloadUrl
            def extension
            for (item in data) {
                if (version == item.version) {
                    for (asset in item.assets) {
                        if (projectType == AppConfiguration.javaType
                                && asset.path.endsWith(".war") && !asset.path.endsWith("full.war")) {
                            extension = '.war'
                            downloadUrl = asset.downloadUrl
                        } else if (asset.path.endsWith(".jar") && artifactJar) {
                            extension = '.jar'
                            downloadUrl = asset.downloadUrl
                        } else if (asset.path.endsWith(".tar.gz")) {
                            extension = '.tar.gz'
                            downloadUrl = asset.downloadUrl
                        } else if (asset.path.endsWith(".rpm")) {
                            extension = '.rpm'
                            downloadUrl = asset.downloadUrl
                        }
                    }
                }
            }
            if (!downloadUrl || !extension) {
                println "Error, artifact not found: $downloadUrl $extension"
                currentBuild.result = 'FAILURE'
                currentBuild.description = 'Artifact missing'
                return
            }

            archive = AppConfiguration.findArchiveByApp(app)
            if (archive == null) archive = "${app}${extension}"

            currentBuild.description = "${app}:${version} / ${deployAs} / ${domain}"

            process = ["curl", "-u", "${Consts.nexusCredentials}", "-k", "-o", "${WORKSPACE}/${archive}", "${downloadUrl}"]
            println "curl -u ${Consts.nexusCredentials} -k -o '${WORKSPACE}/${archive}' '${downloadUrl}'"
            proc = process.execute()
            println proc.err.text

        }

        stage('undeploy') {
            if (projectType == AppConfiguration.javaType && deployAs == Consts.deployAsTomcatArtifact) undeploy(app, domain, archive)
        }

        stage('deploy') {
            deploy(app, domain, archive, deployAs)
        }

        stage('checks') {
            if (projectType == AppConfiguration.javaType && deployAs == Consts.deployAsTomcatArtifact) deployCheck(app, domain)
        }

        if (telegramNotify) {
            def message = "Deploy application $app:$version on $domain"
            telegram(telegramChatId, Consts.telegramCredential, Consts.defaultTelegramSocks5Credential, '\uD83C\uDFC3', 'SUCCESS', message)
        }

    } catch (any) {
        if (telegramNotify) {
            def message = "Deploy application $app:$version on $domain failed ${currentBuild.description}"
            telegram(telegramChatId, Consts.telegramCredential, Consts.defaultTelegramSocks5Credential, '\\uD83D\\uDE31', 'FAILED', message)
        }

        throw any
    }
}

#!/usr/bin/env groovy
import Consts
import EnvConfiguration

def call(String app, String domain, String archive, String deployAs) {

    def hostParams = EnvConfiguration.findHost(domain)
    def host = hostParams.host
    if (host == null) {
        currentBuild.result = 'FAILURE'
        currentBuild.description = "Unknown domain name $domain"
        return
    }

    if (deployAs == Consts.deployAsRpm) {
        def rpmDeployPath = hostParams.rpmDeployPath ? hostParams.rpmDeployPath : EnvConfiguration.defaultRpmDeployPath
        def arch = AppConfiguration.findArchByApp(app)
        deployRpm(host, archive, rpmDeployPath, app, arch, domain)
        return
    } else if (deployAs == Consts.deployAsTomcatArtifact) {
        def tomcatDeployPath = hostParams.warDeployPath ? hostParams.warDeployPath : EnvConfiguration.defaultTomcatDeployPath
        deployWar(host, archive, tomcatDeployPath)
        return
    } else if (deployAs == Consts.deployAsDocker || deployAs == Consts.deployAsArchive) {
        def deployPath = hostParams.deployPath ? hostParams.deployPath : EnvConfiguration.defaultDeployPath
        deployDefault(host, archive, deployPath, app, domain, deployAs == Consts.deployAsDocker)
        return
    }

    currentBuild.result = 'FAILURE'
    currentBuild.description = "Unknown deploy method: $deployAs"
}

/**
 * There is the git project with additional config files for every stage Consts.gitApplicationConfigs
 * and if we find files for current application and host we'll put them into a deploy directory
 */
def checkConfigFiles(host, app) {
    def folder = new File("${WORKSPACE}/${host}/${app}")
    return folder.exists() ? folder.absolutePath : null
}

def deployRpm(host, archive, deployPath, app, arch, domain) {
    println "Rpm install ${host} ${app}:${version}:${arch}"

    def archiveLocalLocation = "/tmp/${archive}"

    def remote = [:]
    remote.name = host
    remote.host = host
    remote.allowAnyHosts = true

    withCredentials([sshUserPrivateKey(credentialsId: Consts.mp3DeployerSshCredential, keyFileVariable: 'identity', passphraseVariable: '', usernameVariable: 'userName')]) {
        remote.user = userName
        remote.identityFile = identity
        sshPut remote: remote, from: "${archiveLocalLocation}", into: "${deployPath}/${archive}"
        sshCommand remote: remote, command: "sudo rpm --force -Uvh ${deployPath}/${archive}"

        def configFilesPath = checkConfigFiles(domain, app)
        println '-----------------------------'
        println "FILE CONFIGS FOR PROJECT: ${app} AND DOMAIN: ${domain} IS: ${configFilesPath}"
        if (configFilesPath) {
            sh("tar -zcvf ${WORKSPACE}/${app}-temp.tar.gz -C ${configFilesPath} .")
            sshPut remote: remote, from: "${WORKSPACE}/${app}-temp.tar.gz", into: "/tmp/${app}-temp.tar.gz"
            sshCommand remote: remote, command: "tar --preserve-permissions --no-overwrite-dir -zxvf /tmp/${app}-temp.tar.gz --directory /opt/msp/${app}"
        }

        sshCommand remote: remote, command: "sudo systemctl start ${app} | true"
    }
}

def deployDefault(host, archive, deployPath, app, domain, isDocker) {
    def archiveLocalLocation = "/tmp/${archive}"

    if (!fileExists(archiveLocalLocation)) {
        currentBuild.result = 'FAILURE'
        currentBuild.description = "Build archive $archiveLocalLocation not found"
        return
    }

    def remote = [:]
    remote.name = host
    remote.host = host
    remote.allowAnyHosts = true

    withCredentials([sshUserPrivateKey(credentialsId: Consts.mp3DeployerSshCredential, keyFileVariable: 'identity', passphraseVariable: '', usernameVariable: 'userName')]) {
        remote.user = userName
        remote.identityFile = identity
        def configFilesPath = checkConfigFiles(domain, app)
        def afterBuildCommand = AppConfiguration.getAfterBuildCommand(app)
        println '-----------------------------'
        println "FILE CONFIGS FOR PROJECT: ${app} AND DOMAIN: ${domain} IS: ${configFilesPath}"

        sshCommand remote: remote, command: "mkdir -p ${deployPath}/${app} | true"
        // Do it two times because we need to have docker-compose.yml to stop container
        // and second time because we need to overwrite existing project files
        if (configFilesPath) {
            sshPut remote: remote, from: "${configFilesPath}", into: "${deployPath}"
        }
        if (isDocker) {
            sshCommand remote: remote, command: "cd ${deployPath}/${app} && docker-compose stop"
        }
        sshPut remote: remote, from: "${archiveLocalLocation}", into: "${deployPath}/${app}/${archive}"
        sshCommand remote: remote, command: "cd ${deployPath}/${app} && tar -xzvmf ${archive} && rm ${archive}"
        if (configFilesPath) {
            sshPut remote: remote, from: "${configFilesPath}", into: "${deployPath}"
        }
        if (isDocker) {
            sshCommand remote: remote, command: "cd ${deployPath}/${app} && docker-compose up -d && docker-compose restart"
        }
        if (configFilesPath) {
            def executeFile = new File("${WORKSPACE}/${domain}/${app}/${Consts.executeAfterDeployFileName}")
            if (executeFile.isFile()) {
                sshCommand remote: remote, command: "cd ${deployPath}/${app} && chmod +x ${Consts.executeAfterDeployFileName} && ./${Consts.executeAfterDeployFileName}"
            }
        }
        if (afterBuildCommand != '') {
            sshCommand remote: remote, command: afterBuildCommand
        }
    }
    // && (docker exec -t nginx service nginx restart || true)
}

def deployWar(host, archive, tomcatDeployPath) {
    def archiveLocalLocation = "/tmp/${archive}"

    if (!fileExists(archiveLocalLocation)) {
        currentBuild.result = 'FAILURE'
        currentBuild.description = "Build archive $archive not found"
        return
    }

    def remote = [:]
    remote.name = host
    remote.host = host
    remote.allowAnyHosts = true

    withCredentials([sshUserPrivateKey(credentialsId: Consts.mp3DeployerSshCredential, keyFileVariable: 'identity', passphraseVariable: '', usernameVariable: 'userName')]) {
        remote.user = userName
        remote.identityFile = identity
        sshPut remote: remote, from: "${archiveLocalLocation}", into: "${tomcatDeployPath}/${archive}"
    }
}

return this

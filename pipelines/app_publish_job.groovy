
def AppConfiguration = this.class.classLoader.parseClass(readFileFromWorkspace('src/AppConfiguration.groovy'))
def Consts = this.class.classLoader.parseClass(readFileFromWorkspace('src/Consts.groovy'))

for (projectConf in AppConfiguration.projectList) {
    def app = projectConf.app
    def isRpm = projectConf.rpm
    def projectType = projectConf.type
    def repository = AppConfiguration.findRepositoryByApp(app)
    def rpmSpecFile = AppConfiguration.getRpmSpecFile(app)
    def arch = AppConfiguration.findArchByApp(app)
    def configFile = AppConfiguration.findConfigByApp(app)
    def appArchive = AppConfiguration.findArchiveByApp(app)
    def artifactJar = AppConfiguration.getArtifactJar(app)

    def credentials = AppConfiguration.getCredentials(app)
    if (credentials == null) {
        credentials = Consts.mp3DeployerCredential
    }

    def taskName = AppConfiguration.getTaskName(app)
    if (taskName == null) {
        taskName = Consts.defaultPrefixAutoJobName
    }

    pipelineJob("${taskName}-build-publish-${app}-auto") {

        description("""Project: ${app}<br/>Type: ${projectType}<br/>Repository: <a href="${repository}">${repository}</a>""")

        logRotator {
            numToKeep(10)
            artifactNumToKeep(1)
        }

        triggers {
            gitlabPush {
                setBuildDescription()
                buildOnPushEvents(true)
                buildOnMergeRequestEvents(false)
                rebuildOpenMergeRequest('never')
                includeBranches('master,develop')
            }
        }

        definition {
            parameters {
                stringParam('branch', 'master', 'Branch to build from')
                booleanParam('testing', false, 'Run test or not')
                booleanParam('runIntegrationTests', false, 'Run integration or only unit tests')
                booleanParam('notifyTelegram', false, 'Send Telegram notification')
            }
            cps {
                sandbox()
                script("""
                    @Library('${Consts.jenkinsLibrary}') _

                    node('master') {
                        def version = 'unspecified'
                        def archive = ''
                        def created = ''
                        def versionTemp = ''
                        def url = ''
                        def smile = ''
                        def branch = env.gitlabSourceBranch ? env.gitlabSourceBranch : params.branch
                        def isSnapshot = branch != 'master' && branch != 'msp2'
                        def testing = params.testing
                        def runIntegrationTests = params.runIntegrationTests
                        def rpmRepository = isSnapshot ? '${Consts.rpmSnapshotRepository}' : '${Consts.rpmRepository}'
                        def notifyTelegram = params.notifyTelegram
                        def jobName = "\${env.JOB_NAME}-\${env.BUILD_NUMBER}"
                        def telegramMessage
                        def publishResults
                        def dockerImage
                        def dockerImageName
                        def dockerImageLastestTag = Consts.nexusUrl.replace('https://', '') + '/' + '${app}:latest' 
                        
                        try {
                            if (notifyTelegram) {
                                telegramMessage = currentBuild.description 
                                    ? "\${currentBuild.description}\\nbranch: \${branch}\\n\${jobName}\\n\${env.BUILD_URL}console" 
                                    : "\${jobName}\\nbranch: \${branch}\\n\${env.BUILD_URL}console"
                                    
                                telegram('${Consts.defaultTelegramChat}', '${Consts.telegramCredential}', 
                                    '${Consts.defaultTelegramSocks5Credential}', '\\uD83C\\uDFC3', 'START', telegramMessage)
                            }

                            if ('${projectType}' == '${AppConfiguration.goType}') {
                                dir("src/$app") {
                                    stage('checkout') {
                                        println "Checkout \$branch"
                                        git(url: '$repository', branch: branch, credentialsId: '$credentials')
                                        try { 
                                            versionTemp = readFile("${Consts.goVersionFile}").trim()
                                        } catch (any) {}
            
                                        if (versionTemp) {
                                            version = versionTemp
                                        }
                                        version = version + "\${isSnapshot ? '-SNAPSHOT' : ''}"
                                        archive = "${app}-\${version}.tar.gz"
                                        created = new Date().format("yyyy-MM-dd'T'HH:mm:ss")
                                        
                                        if (currentBuild.description) {
                                            currentBuild.description = currentBuild.description + " \${archive}"
                                        } else {
                                            currentBuild.description = "\${archive}"
                                        }
                                    }
                                }
                            } else if ('${projectType}' == '${AppConfiguration.frontendType}') {
                                stage('checkout') {
                                    println "Checkout \$branch"
                                    git(url: '$repository', branch: branch, credentialsId: '$credentials')
    
                                    def tempVersion = sh(script: "cat package.json | grep version | head -1 | awk -F: '{ print \\\$2 }' | sed 's/[\\\",\t ]//g'", returnStdout: true)
                                    if (tempVersion) version = tempVersion.trim()
                                    version = version + "\${isSnapshot ? '-SNAPSHOT' : ''}"
                                    archive = "${app}-\${version}.tar.gz"
                                    if (currentBuild.description) {
                                        currentBuild.description = currentBuild.description + " \${archive}"
                                    } else {
                                        currentBuild.description = "\${archive}"
                                    }
                                }
                            } else {
                                stage('checkout') {
                                    println "Checkout \$branch"
                                    git(url: '$repository', branch: branch, credentialsId: '$credentials')
                                }
                            }
                            
                            stage('build') {
                                buildProject('$app', branch, version, archive)
 
                                if ("${projectType}" == "${AppConfiguration.goType}") {
                                    println "-----------------"
                                    println "build docker image"
                                    
                                    dir("src/$app/build") {                                    
                                        sh("rm -Rf Dockerfile")
                                        sh("cp -r \${WORKSPACE}@libs/${Consts.jenkinsLibraryName}/resources/Dockerfile .")
  
                                    
                                        def tag = version.replaceAll('-', '.')
                                        dockerImageName = "${app}:\${tag}"
                                        dockerImage = docker.build(dockerImageName, "--build-arg app_name=${app} .")
                                        sh("docker tag \${dockerImageName} \${dockerImageLastestTag}")           
                                                  
                                    }
                                }
                            }
                            
                            stage('test') {
                                if ("${projectType}" == "${AppConfiguration.goType}") {
                                    goTest("${app}", testing, runIntegrationTests)
                                }
                            }
                            
                            stage('publish') {
                                publishResults = publish('$app', branch, version, archive, $artifactJar)
                                println '-----------------'
                                println "Artifacts: \${publishResults}"
                            }
                            
                            if (${isRpm}) {
                                stage('build, publish rpm') {
                                    println "-----------------"
                                    println "Creating rpm package"
                                    
                                    sh("rm -Rf \${WORKSPACE}/rpmbuild && mkdir -p \${WORKSPACE}/rpmbuild/SOURCES")
                                    sh("cp -r \${WORKSPACE}@libs/${Consts.jenkinsLibraryName}/rpm/SPECS \${WORKSPACE}/rpmbuild")
                                    
                                    for(Map<String, String> result : publishResults) {
                                        println "Create rpm for \${result.name}" 
                                        def rpmVersion = result.version.replaceAll('-','.')
                                        if (isSnapshot && '${projectType}' == '${AppConfiguration.javaType}') {
                                            rpmVersion += '.SNAPSHOT'
                                        }
                                        sh("cp \${result.path} \${WORKSPACE}/rpmbuild/SOURCES")
                                        
                                        def rpmCommand = "rpmbuild -bb "
                                        rpmCommand += "--define '_topdir \${WORKSPACE}/rpmbuild' "
                                        rpmCommand += "--define '__app_name ${app}' "
                                        rpmCommand += "--define '__app_raw_name ${appArchive}' "
                                        rpmCommand += "--define '__app_path \${result.path}' "
                                        rpmCommand += "--define '__app_version \${rpmVersion}' "
                                        rpmCommand += "--define '__app_binary \${result.name}' "
                                        rpmCommand += "--define '__app_config ${configFile}' "
                                        rpmCommand += "--define '_topdir \${WORKSPACE}/rpmbuild' "
                                        rpmCommand += "--define '__app_schema ${projectConf.schema}' "
                                        rpmCommand += "--define '__app_context ${app}' "
                                        rpmCommand += "${rpmSpecFile}"
                                        rpmCommand = rpmCommand.replaceAll("[\\r\\n]+", " ")
                                        
                                        sh ("cd rpmbuild/SPECS && \${rpmCommand}")
                                        
                                        println "-------------------"
                                        println "Publish rpm archive"
                                        
                                        def uploadCommand = "curl -v -k --user '${Consts.nexusCredentials}' "
                                        uploadCommand += "--upload-file \${WORKSPACE}/rpmbuild/RPMS/${arch}/${app}-\${rpmVersion}-0.${arch}.rpm "
                                        uploadCommand += "${Consts.nexusUrl}/repository/\${rpmRepository}/${app}/${app}-\${rpmVersion}-0.${arch}.rpm"
                                        uploadCommand = uploadCommand.replaceAll("[\\r\\n]+", " ");
            
                                        sh("\${uploadCommand}")
                                    }
                                }
                                
                                if (dockerImage != null) {
                                    stage('push docker image') {
                                        docker.withRegistry(Consts.nexusUrl, Consts.nexusMp3DeployerCredential) {
                                            dockerImage.push()
                                            dockerImage.push('latest')
                                        }
                                    }
                                }
                            }
                        
                            if (notifyTelegram) {
                                telegramMessage = "\${currentBuild.description}\\nbranch: \${branch}\\n\${env.BUILD_URL}console"
                                if (currentBuild.result != 'FAILURE') {
                                    currentBuild.result = "SUCCESS"
                                    smile = '\\uD83D\\uDC4C'
                                } else {
                                    smile = '\\uD83D\\uDE31'
                                }
                                telegram('${Consts.defaultTelegramChat}', '${Consts.telegramCredential}', 
                                    '${Consts.defaultTelegramSocks5Credential}', smile, "\${currentBuild.result}, took: \${formatDurationTime()}", telegramMessage)
                            }
                        } catch (any) {
                            if (notifyTelegram) {
                                telegramMessage = "Application $app:\$version\\n\${currentBuild.description}\\nbranch: \${branch}\\n\${env.BUILD_URL}console"
                                telegram('${Consts.defaultTelegramChat}', '${Consts.telegramCredential}', 
                                    '${Consts.defaultTelegramSocks5Credential}', '\\uD83D\\uDE31', "FAILURE, took: \${formatDurationTime()}", telegramMessage)
                            }
                    
                            throw any
                        } finally {
                            if (dockerImage != null) {
                                sh("docker rmi \${Consts.nexusUrl.replace('https://', '') + '/' + dockerImageName} | true")
                                sh("docker rmi \${dockerImageName} | true")
                                sh("docker rmi \${dockerImageLastestTag} | true")
                            }
                        }

                    }
                    String formatDurationTime() {
                        def seconds = currentBuild.getDuration() / 1000
                        def minutes = (int) (seconds / 60)
                        String.format("%d min, %d sec", minutes, (int) (seconds - minutes * 60))
                    }
                    
                    """.stripIndent())
            }
        }
    }
}

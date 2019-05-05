def Consts = this.class.classLoader.parseClass(readFileFromWorkspace('src/Consts.groovy'))

pipelineJob(Consts.buildRpmJobName) {

    definition {
        parameters {
            stringParam('app', '', '')
            stringParam('url', '', '')
            stringParam('artifact', '', '')
            stringParam('version', '', '')
            stringParam('branch', '', '')
            stringParam('schema', '', '')
            stringParam('config', '', '')
        }
        cps {
            sandbox()
            script("@Library('${Consts.jenkinsLibrary}') _" + '''

                node('master') {
                    
                    def app = params.app
                    def url = params.url
                    def artifact = params.artifact
                    def version = params.version
                    def branch = params.branch
                    def schema = params.schema
                    def config = params.config
                    
                    def workspace = pwd()
                
                    if (!app || !url || !artifact || !version || !branch || !config) {
                        println "Update version failed.: $app $artifact $url $version $branch"
                        currentBuild.result = 'FAILURE'
                        currentBuild.description = 'Params missing'
                        return
                    }
                
                    deleteDir()
                   
                    
                    def project = params.project
                    def version = params.version
                    def url = params.url
                    
                    if (!project || !version || !url) {
                        println "Update version failed.: $project $version $url"
                        currentBuild.result = 'FAILURE'
                        currentBuild.description = 'Params missing'
                        return
                    }
                    
                    currentBuild.description = "$project/$version"
                
                    stage('checkout') {
                        if (gitlabPush && env.gitlabSourceBranch != null) {
                            branch = env.gitlabSourceBranch
                        }
                        
                        println "Checkout $branch"
                        git (url: 'git@gitlab.alx:devops/msp-delivery-rpmspec.git', branch: 'master', credentialsId: '3c354c64-fabe-45ab-9bd7-dcde9b321711')
                    }
                    
                    stage('build') {
                        // sh ("./rpmbuild/build-app.sh ${project} ${version} ${url}")
                        println "Update version for: $app $url $version $branch"
                        
                        println "-----------------"
                        println "Download artifact"
                        
                        sh("curl -v -k --fail ${url} -o ./rpmbuild/SOURCES/${artifact}")
                        
                        println "-----------------"
                        println "Build rpm archive"
                        
                        def rpmApp = app.startsWith('msp') ? app : "msp-${app}" 
                        def rpmVersion = version.replaceAll('-','.')
                        def rpmContext = '/' + artifact.substring(0, artifact.lastIndexOf('.')).replace('#', '/')
                        
                        def rpmCommand = """
                            rpmbuild -bb 
                                --define '_topdir ${workspace}/rpmbuild\'
                                --define '__app_name ${rpmApp}' 
                                --define '__app_version ${rpmVersion}' 
                                --define '__app_binary ${artifact}' 
                                --define '__app_config ${config}' 
                                --define '__app_schema ${schema}' 
                                --define '__app_context ${rpmContext}' 
                            msp-app.spec""".replaceAll("[\\r\\n]+", " ");
                        sh ("cd rpmbuild/SPECS && ${rpmCommand}")
                        
                        println "-------------------"
                        println "Publish rpm archive"
                        
                        def uploadCommand = """
                            curl -v --user 'mp3deployer:ScjKLQuvqfAXu2bs8ysLAvRt\'
                                --upload-file ./rpmbuild/RPMS/noarch/${rpmApp}-${rpmVersion}-0.noarch.rpm
                                https://nexus.msp.mobi/repository/msp-yum/msp/${rpmApp}-${rpmVersion}-0.noarch.rpm""".replaceAll("[\\r\\n]+", " ");
                        
                        sh ("${uploadCommand}") 
                    }   
                 
                }      
    
            '''.stripIndent())
        }
    }
}

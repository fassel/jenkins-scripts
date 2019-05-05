def Consts = this.class.classLoader.parseClass(readFileFromWorkspace('src/Consts.groovy'))

pipelineJob(Consts.tomcatRpmJobName) {

    definition {
        cps {
            sandbox()
            script("""
                node {
                    deleteDir()
                
                    stage('checkout') {
                        git url:'${Consts.gitDeliveryConfiguration}', branch: 'master', 
                            credentialsId: '${Consts.mp3DeployerCredential}'
                    }
                
                    stage('download dependencies') {
                        sh("\${tool '${Consts.gradleToolName}'}/bin/gradle tgzTomcatDependencies")
                    }
                    
                    stage('build rpm') {
                        sh('rpmbuild -bb --define "_topdir `pwd`/rpm" --define "__app_path \${WORKSPACE}/rpm" \${WORKSPACE}/rpm/SPECS/msp-tomcat.spec')
                    }
                            
                    stage('publish rpm') {
                        
                        def dir = new File("\${WORKSPACE}/rpm/RPMS/noarch/")
                        def artifactName = ''
                        for (File file : dir.listFiles()) {
                            if (file.name.startsWith("msp-tomcat-")) {
                                artifactName = file.name
                                break
                            }
                        }
                        
                        if (artifactName == '' || !artifactName) {
                            currentBuild.result = 'FAILURE'
                            currentBuild.description = "Tomcat rpm not found"
                            return
                        }
                        
                        currentBuild.description = artifactName
                        
                        def uploadCommand = "curl -v -k --user '${Consts.nexusCredentials}' "
                        uploadCommand += "--upload-file \${WORKSPACE}/rpm/RPMS/noarch/\${artifactName} "
                        uploadCommand += "${Consts.nexusUrl}/repository/${Consts.rpmRepository}/msp-tomcat/\${artifactName}"
                        uploadCommand = uploadCommand.replaceAll("[\\r\\n]+", " ");

                        sh("\${uploadCommand}")
                        
                    }
                }      
    
            """.stripIndent())
        }
    }
}

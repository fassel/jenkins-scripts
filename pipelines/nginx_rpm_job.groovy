def Consts = this.class.classLoader.parseClass(readFileFromWorkspace('src/Consts.groovy'))

pipelineJob(Consts.nginxRpmJobName) {

    definition {
        cps {
            sandbox()
            script("""
                node {
                    deleteDir()
                
                    stage('checkout') {
                        git url:'${Consts.gitDeliveryConfiguration}', branch: 'version2', 
                            credentialsId: '${Consts.mp3DeployerCredential}'
                    }
                
                    stage('build rpm') {
                        sh('rpmbuild -bb --define "_topdir `pwd`/rpm" --define "__app_path \${WORKSPACE}/rpm" \${WORKSPACE}/rpm/SPECS/nginx-clojure.spec')
                    }
                            
                    stage('publish rpm') {
                        
                        def dir = new File("\${WORKSPACE}/rpm/RPMS/x86_64/")
                        def artifactName = ''
                        for (File file : dir.listFiles()) {
                            if (file.name.startsWith("msp-nginx-")) {
                                artifactName = file.name
                                break
                            }
                        }
                        
                        if (artifactName == '' || !artifactName) {
                            currentBuild.result = 'FAILURE'
                            currentBuild.description = "Nginx rpm not found"
                            return
                        }
                        
                        currentBuild.description = artifactName
                        
                        def uploadCommand = "curl -v -k --user '${Consts.nexusCredentials}' "
                        uploadCommand += "--upload-file \${WORKSPACE}/rpm/RPMS/x86_64/\${artifactName} "
                        uploadCommand += "${Consts.nexusUrl}/repository/${Consts.rpmRepository}/msp-nginx/\${artifactName}"
                        uploadCommand = uploadCommand.replaceAll("[\\r\\n]+", " ");

                        sh("\${uploadCommand}")
                        
                    }
                }      
    
            """.stripIndent())
        }
    }
}

def Consts = this.class.classLoader.parseClass(readFileFromWorkspace('src/Consts.groovy'))

pipelineJob(Consts.publishReleaseJobName) {

    triggers {
        cron('00 10 * * 5')
    }

    definition {
        cps {
            sandbox()
            script("""
                node {
                    deleteDir()
                
                    stage('checkout') {
                        git url:'${Consts.gitDeliveryVersion}', branch: 'master', 
                            credentialsId: '${Consts.mp3DeployerCredential}'
                    }
                
                    stage('release') {
                        
                        sshagent(credentials: ['${Consts.mp3DeployerCredential}']) {
                            
                            def calendar = Calendar.getInstance()
                            
                            def year = calendar.get(Calendar.YEAR)
                            def week = calendar.get(Calendar.WEEK_OF_YEAR)
                            def buildnum = 0;
                            def tag = "\${year}.\${week}.\${buildnum}"
                           
                            while (true) {
                                tag = "\${year}.\${week}.\${buildnum}"
                                def exists = sh(script: "git ls-remote --tags origin | grep \$tag  | wc -l", returnStdout: true).trim()
                                
                                if ( exists.equals('0') ) {
                                    sh ("git tag -a \$tag -m 'create release version \$tag'")
                                    sh ("git push origin \$tag")
                                    break
                                } 
                                
                                buildnum++;
                                if (buildnum > 10) {
                                    currentBuild.result = 'FAILURE'
                                    currentBuild.description = 'Build number exceed'
                                    return
                                }
                            }
                            
                            def NEXUS_URL = "${Consts.nexusUrl}/repository/msp-maven-releases/${Consts.devopsReleaseRepository}"
                            sh("curl -v -k -u '${Consts.nexusCredentials}' --upload-file installation-stable.txt   \$NEXUS_URL/\${tag}-stable/release-\${tag}-stable.txt")
                            sh("curl -v -k -u '${Consts.nexusCredentials}' --upload-file installation-unstable.txt \$NEXUS_URL/\${tag}-unstable/release-\${tag}-unstable.txt")
                        }
                        
                    }
                }      
    
            """.stripIndent())
        }
    }
}

def Consts = this.class.classLoader.parseClass(readFileFromWorkspace('src/Consts.groovy'))

pipelineJob(Consts.publishInstallationJobName) {

    definition {
        parameters {
            stringParam('version', '1.0', 'Version to publish')
        }
        cps {
            sandbox()
            script("""
                node('master') {
                    def version = params.version
                    
                    stage('checkout') {
                        git url: '${Consts.gitDeliveryConfiguration}', branch: '${Consts.gitJenkinsLibraryBranch}',
                            credentialsId: '${Consts.mp3DeployerCredential}'
                    }
                    
                    stage('publish') {
                        sh("installation/cityinstall-publish.sh \$version")
                    }
                }""".stripIndent())
        }
    }
}

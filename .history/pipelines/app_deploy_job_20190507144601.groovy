def EnvConfiguration = this.class.classLoader.parseClass(readFileFromWorkspace('src/EnvConfiguration.groovy'))
def AppConfiguration = this.class.classLoader.parseClass(readFileFromWorkspace('src/AppConfiguration.groovy'))
def Consts = this.class.classLoader.parseClass(readFileFromWorkspace('src/Consts.groovy'))


// Deploy artifact from nexus
pipelineJob(Consts.deployAppJobName) {
    definition {
        parameters {
            booleanParam('telegramNotify', false, 'Send telegram notification')
            stringParam('telegramChatId', Consts.defaultTelegramChat, 'Telegram chat identifier')

            choiceParam('domain', EnvConfiguration.domainList(), 'Select domain to deploy')
            choiceParam('projectType', AppConfiguration.getProjectTypes(), 'Select project type')
            //choiceParam('application', AppConfiguration.getApplications(), 'Select project to deploy')
            activeChoiceReactiveParam('application') {
                description('Select project to deploy')
                choiceType('SINGLE_SELECT')
                groovyScript {
                    script(""" 
                        try {
                            def projects = ${AppConfiguration.getProjectsGroupByType().inspect()}
                            projects = projects[projectType]
                            List<String> artifacts = new ArrayList<String>()
                            for (item in projects) {
                                artifacts.add(item.app)
                            }
                            return artifacts.toSorted { a, b -> a <=> b }
                        } catch (ex) {
                            return  [ex.getMessage()]
                        }

                    """.stripIndent())
                    fallbackScript('["error"]')
                }
                referencedParameter('projectType')
            }
            activeChoiceReactiveParam('deployAs') {
                description('Select how deploy the project')
                choiceType('SINGLE_SELECT')
                groovyScript {
                    script(""" 
                        try {
                            if (projectType == '${AppConfiguration.frontendType}') {
                                return ['${Consts.deployAsRpm}', '${Consts.deployAsArchive}']
                            }
                            if (projectType == '${AppConfiguration.goType}') {
                                return ['${Consts.deployAsRpm}', '${Consts.deployAsDocker}']
                            }
                            if (projectType == '${AppConfiguration.tomcatType}' || projectType == '${AppConfiguration.nginxType}') {
                                return ['${Consts.deployAsRpm}']
                            }
                            return []
                        } catch (ex) {
                            return  [ex.getMessage()]
                        }

                    """.stripIndent())
                    fallbackScript('["error"]')
                }
                referencedParameter('projectType')
            }
            choiceParam('branch', ['master', 'develop'], 'Select branched version')
            activeChoiceReactiveParam('version') {
                description('Choose recently published version')
                choiceType('SINGLE_SELECT')
                groovyScript {
                    script("""
                        import groovy.json.JsonSlurper

                        try {
                            def repository = branch != 'master' && branch != 'msp2' ?  '${Consts.snapshotRepository}' : '${Consts.releaseRepository}'
                            if (deployAs == '${Consts.deployAsRpm}') {
                                repository = branch != 'master' && branch != 'msp2' ? '${Consts.rpmSnapshotRepositorySearch}' : '${Consts.rpmRepositorySearch}' 
                            }
                            
                            def url = "${Consts.nexusUrl}/service/rest/v1/search?repository=\${repository}&name=\${application}".toString()
                            process = ["curl", "-u", "${Consts.nexusCredentials}", "-k", "-X", "GET", "-H", "Accept: application/json", "\${url}"]
                        
                            def initialSize = 4096
                            def out = new ByteArrayOutputStream(initialSize)
                            def err = new ByteArrayOutputStream(initialSize)
                            def proc = process.execute()
                            proc.consumeProcessOutput(out, err)
                            proc.waitFor()
                        
                            data = new JsonSlurper().parseText(out.toString()).items
                            List<String> artifacts = new ArrayList<String>()
                            for (item in data) {
                                if (item.version) artifacts.add(item.version)
                            }
                            return artifacts.sort { a, b -> 
                                try {
                                    def aTemp = a.replaceAll("\\\\.SNAPSHOT", "").replaceAll("-0", "").split("\\\\.")
                                    def bTemp = b.replaceAll("\\\\.SNAPSHOT", "").replaceAll("-0", "").split("\\\\.")
                                    if (aTemp.length != 3 || bTemp.length != 3) return a <=> b
                                    if (aTemp[0] != bTemp[0]) return bTemp[0] as Integer <=> aTemp[0] as Integer
                                    if (aTemp[1] != bTemp[1]) return bTemp[1] as Integer <=> aTemp[1] as Integer
                                    if (aTemp[2] != bTemp[2]) return bTemp[2] as Integer <=> aTemp[2] as Integer
                                } catch (Exception unused) {
                                    return a <=> b
                                } 
                            }
                        } catch (ex) {
                            return  [ex.getMessage()]
                        }

                    """.stripIndent())
                    fallbackScript('["error"]')
                }
                referencedParameter('application,branch,deployAs')
            }
        }
        cps {
            sandbox()
            script(readFileFromWorkspace("pipelines/app_deploy_pipeline.groovy"))
        }
    }
}

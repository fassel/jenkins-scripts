class AppConfiguration {

    static String frontendType = 'front'
    static String goType = 'go'
    static String javaType = 'java'
    static String tomcatType = 'tomcat'
    static String nginxType = 'nginx'

    static String defaultBuildDirectory = 'build'
    static String defaultBuildCommand = 'build'
    static String defaultBuildTool = 'yarn'

    static String defaultArch = 'x86_64'

    static String defaultRpmSpecFile = 'app.spec'

    static String defaultConfigFile = 'config.yml'

    static String defaultPublishScriptPath = ''

    static List<String> defaultArtifactsDirectories = ['build/libs/']

    // We need to know the name of this project because it build in a little different way
    static String adminAppName = 'admin'

    // project              - some sort of group
    // app                  - application name
    // groupId              - group id for publish an artifact to nexus
    // repository           - git repository with a source code
    // archive              - archive name, mostly for specify version to deploy into tomcat
    // schema               - need for rpm
    // config               - config file name, use for create rpm package
    // type                 - type of a project, it impacts how the project will build
    // taskName             - name for jenkins auto build job ${taskName}-build-publish-${project}-auto
    // rpm                  - either create rpm when build is running or not
    // arch                 - architecture (x86_64, noarch), only for creating rpm
    // rpmSpecFile          - file name for creating rpm package from directory in this project ./rpm/SPECS/
    // deployAsRpm          - deploy an app from rpm package
    // buildDirectory       - directory with built static files, only for frontend application type
    // artifactsDirectories - directories that contain java artifacts, only for java projects
    // buildCommand         - command for built static files, only for frontend application type
    // artifactJar          - create jar artifact, only for java projects
    // buildTool            - tool for build npm or yarn, only for frontend application type
    // credentials          - for access git with a project
    // publishScriptPath    - path where is a publish script, only for java projects

    static List<Map<String, String>> projectList = [
            [
                    project    : 'main',
                    app        : 'fishtravel-admin',
                    repository : 'git@gitlab.tracker.fish:development/fishtravel-admin.git',
                    archive    : 'fishtravel-admin.gz',
                    type       : frontendType,
                    taskName   : 'frontend',
                    groupId    : 'ru.main.front',
                    arch       : 'noarch',
                    rpmSpecFile: 'front.spec',
                    rpm        : true,
            ]
    ].asImmutable()

    static List<String> getProjects() {
        projectList.collect { it -> it.get('project') }.unique(false)
    }

    static List<String> getProjectTypes() {
        def projectTypes = projectList.collect { it -> it.get('type') }.unique(true)
        //projectTypes.add(tomcatType)
        //projectTypes.add(nginxType)
        return projectTypes.sort()
    }

    static Map<String, Object> getProjectsGroupByType() {
        projectList.groupBy { it -> it.get('type') }
    }

    static List<String> getProjectsByType(String type) {
        projectList.findResults { it ->
            if (it.get('type') == type) {
                it.get('app')
            }
        }
    }

    static List<String> getApplications() {
        projectList.findResults { it -> it.get('app') }
    }

    static List<String> getApplications(String project) {
        projectList.findResults { it ->
            if (it.get('project') == project) {
                it.get('app')
            }
        }
    }

    static List<String> getRpmApplications() {
        projectList.findResults { it ->
            if (it.get('rpm') == true) {
                it.get('app')
            }
        }
    }

    static String getRpmSpecFile(String app) {
        def rpmSpecFile = projectList.findResult { it ->
            if (it.get('app') == app) {
                it.get('rpmSpecFile')
            }
        }
        return rpmSpecFile == null ? defaultRpmSpecFile : rpmSpecFile
    }

    static String getArtifactJar(String app) {
        def artifactJar = projectList.findResult { it ->
            if (it.get('app') == app) {
                it.get('artifactJar')
            }
        }
        return artifactJar == null ? false : artifactJar
    }

    static List<String> getArtifactsDirectories(String app) {
        def artifactsDirectories = projectList.findResult { it ->
            if (it.get('app') == app) {
                it.get('artifactsDirectories')
            }
        }
        return artifactsDirectories == null ? defaultArtifactsDirectories : artifactsDirectories
    }

    static String getBuildDirectory(String app) {
        def buildDirectory = projectList.findResult { it ->
            if (it.get('app') == app) {
                it.get('buildDirectory')
            }
        }
        return buildDirectory == null ? defaultBuildDirectory : buildDirectory
    }

    static String getBuildCommand(String app) {
        def buildCommand = projectList.findResult { it ->
            if (it.get('app') == app) {
                it.get('buildCommand')
            }
        }
        return buildCommand == null ? defaultBuildCommand : buildCommand
    }

    static String getBuildTool(String app) {
        def buildTool = projectList.findResult { it ->
            if (it.get('app') == app) {
                it.get('buildTool')
            }
        }
        return buildTool == null ? defaultBuildTool : buildTool
    }

    static String getGroupIdByApp(String app) {
        projectList.findResult { it ->
            if (it.get('app') == app) {
                it.get('groupId')
            }
        }
    }

    static String findArchiveByApp(String app) {
        projectList.findResult { it ->
            if (it.get('app') == app) {
                it.get('archive')
            }
        }
    }

    static String findArchByApp(String app) {
        def arch = projectList.findResult { it ->
            if (it.get('app') == app) {
                it.get('arch')
            }
        }
        return arch == null ? defaultArch : arch
    }

    static String getTypeByApp(String app) {
        projectList.findResult { it ->
            if (it.get('app') == app) {
                it.get('type')
            }
        }
    }

    static String getPublishScriptPath(String app) {
        def publishScriptPath = projectList.findResult { it ->
            if (it.get('app') == app) {
                it.get('publishScriptPath')
            }
        }
        return publishScriptPath == null ? defaultPublishScriptPath : publishScriptPath
    }

    static String findSchemaByApp(String app) {
        projectList.findResult { it ->
            if (it.get('app') == app) {
                it.get('schema')
            }
        }
    }

    static String findConfigByApp(String app) {
        def config = projectList.findResult { it ->
            if (it.get('app') == app) {
                it.get('config')
            }
        }
        return config == null ? defaultConfigFile : config
    }

    static String findRepositoryByApp(String app) {
        projectList.findResult { it ->
            if (it.get('app') == app) {
                it.get('repository')
            }
        }
    }

    static boolean findRpmByApp(String app) {
        projectList.findResult { it ->
            if (it.get('app') == app) {
                it.get('rpm')
            }
        }
    }

    static String getCredentials(String app) {
        projectList.findResult { it ->
            if (it.get('app') == app) {
                it.get('credentials')
            }
        }
    }

    static String getTaskName(String app) {
        projectList.findResult { it ->
            if (it.get('app') == app) {
                it.get('taskName')
            }
        }
    }

    static Map<String, String> getPropertiesByApp(String app) {
        projectList.find { it -> it.get('app') == app }
    }

    static Boolean isSnapshot(String branch) {
        branch != 'master' && branch != 'main'
    }

    static void main(String... args) {
        def test = projectList.groupBy { it -> it.get('type') }
        println test
    }
}


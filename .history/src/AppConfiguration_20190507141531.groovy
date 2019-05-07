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
            // old platform
            /*[
                    project   : 'msp',
                    app       : 'aaa',
                    repository: 'git@gitlab.alx:mobile-platform/msp.git',
                    archive   : 'aaa#v3.war',
                    groupId   : 'ru.msp.app',
                    type      : javaType,
            ],
            [
                    project   : 'msp',
                    app       : 'aaa-event-handler',
                    repository: 'git@gitlab.alx:mobile-platform/msp.git',
                    archive   : 'aaa-event-handler#v3.war',
                    groupId   : 'ru.msp.app',
                    type      : javaType,
            ],
            [
                    project   : 'msp',
                    app       : adminAppName,
                    repository: 'git@gitlab.alx:mobile-platform/msp.git',
                    archive   : 'webadmin.war',
                    groupId   : 'ru.msp.app',
                    type      : javaType,
            ],
            [
                    project   : 'msp',
                    app       : 'email',
                    repository: 'git@gitlab.alx:mobile-platform/msp.git',
                    archive   : 'email#v3.war',
                    groupId   : 'ru.msp.app',
                    type      : javaType,
            ],
            [
                    project   : 'msp',
                    app       : 'push',
                    repository: 'git@gitlab.alx:mobile-platform/msp.git',
                    archive   : 'push#v3.war',
                    groupId   : 'ru.msp.app',
                    type      : javaType,
            ],
            [
                    project   : 'msp',
                    app       : 'sms',
                    repository: 'git@gitlab.alx:mobile-platform/msp.git',
                    archive   : 'sms#v3.war',
                    groupId   : 'ru.msp.app',
                    type      : javaType,
            ],
            [
                    project   : 'msp',
                    app       : 'storage',
                    repository: 'git@gitlab.alx:mobile-platform/msp.git',
                    archive   : 'storage#v3.war',
                    groupId   : 'ru.msp.app',
                    type      : javaType,
            ],
            [
                    project   : 'msp',
                    app       : 'user-storage',
                    repository: 'git@gitlab.alx:mobile-platform/msp.git',
                    archive   : 'user-storage#v3.war',
                    groupId   : 'ru.msp.app',
                    type      : javaType,
            ],*/
            // Cityservices
            // [
            //         project             : 'msp-cityservices',
            //         app                 : 'msp-cityservices-backend',
            //         repository          : 'git@gitlab.alx:mobile-platform/cityservices.git',
            //         archive             : 'cityservices.war',
            //         schema              : 'cityservices',
            //         config              : 'cityservices.yml',
            //         groupId             : 'ru.city.app',
            //         publishScriptPath   : '.mp-gradle-scripts/',
            //         artifactsDirectories: [
            //                 'cityservices-backend/build/libs/',
            //         ],
            //         arch                : 'noarch',
            //         rpm                 : true,
            //         type                : javaType,
            //         rpmSpecFile         : 'msp-app.spec',
            // ],
            // Java modules
            /*[
                    project             : 'script-service',
                    app                 : 'script-service',
                    repository          : 'git@gitlab.alx:mobile-platform/script-backend.git',
                    archive             : 'script#v3.war',
                    groupId             : 'ru.msp.app',
                    artifactsDirectories: [
                            'backend-data-model/build/libs/',
                            'script-service/build/libs/',
                            'script-service-api/build/libs/'
                    ],
                    type                : javaType,
            ],*/
            // [
            //         project    : 'msp-booking',
            //         app        : 'msp-booking',
            //         repository : 'git@gitlab.alx:mmsp/msp-app-booking.git',
            //         archive    : 'booking.war',
            //         config     : 'booking.yml',
            //         groupId    : 'ru.msp.module',
            //         schema     : 'booking',
            //         type       : javaType,
            //         arch       : 'noarch',
            //         rpmSpecFile: 'msp-app.spec',
            //         rpm        : true,
            // ],
            // [
            //         project    : 'msp-booking_resource',
            //         app        : 'msp-booking_resource',
            //         repository : 'git@gitlab.alx:mmsp/msp-application-booking-resources.git',
            //         archive    : 'booking_resource.war',
            //         groupId    : 'ru.msp.module',
            //         config     : 'booking_resource.yml',
            //         schema     : 'resource_structure',
            //         type       : javaType,
            //         arch       : 'noarch',
            //         rpmSpecFile: 'msp-app.spec',
            //         rpm        : true,
            // ],
            // [
            //         project    : 'msp-telegram_transport',
            //         app        : 'msp-telegram-transport',
            //         repository : 'git@gitlab.alx:mmsp/msp-application-telegram-transport.git',
            //         archive    : 'telegram_transport.war',
            //         schema     : 'telegram_transport',
            //         groupId    : 'ru.msp.module',
            //         config     : 'telegram_transport.yml',
            //         type       : javaType,
            //         arch       : 'noarch',
            //         rpmSpecFile: 'msp-app.spec',
            //         rpm        : true,
            // ],
            // [
            //         project    : 'msp-object-storage',
            //         app        : 'msp-object-storage',
            //         repository : 'git@gitlab.alx:mmsp/msp-object-storage.git',
            //         archive    : 'object_storage.war',
            //         groupId    : 'ru.msp.module',
            //         config     : 'object-storage.yml',
            //         schema     : 'object_storage',
            //         type       : javaType,
            //         arch       : 'noarch',
            //         rpm        : true,
            //         rpmSpecFile: 'msp-app.spec',
            // ],
            // [
            //         project    : 'msp-application-events',
            //         app        : 'msp-application-events',
            //         repository : 'git@gitlab.alx:mmsp/msp-application-events.git',
            //         archive    : 'events.war',
            //         groupId    : 'ru.msp.module',
            //         schema     : 'msp_events',
            //         config     : 'events.yml',
            //         type       : javaType,
            //         arch       : 'noarch',
            //         rpm        : true,
            //         rpmSpecFile: 'msp-app.spec',
            // ],
            // [
            //         project    : 'msp-citymatica-chart',
            //         app        : 'msp-citymatica-chart',
            //         repository : 'git@gitlab.alx:mmsp/msp-citymatica-chart.git',
            //         archive    : 'citymatica-chart.war',
            //         groupId    : 'ru.msp.module',
            //         schema     : 'msp_events',
            //         config     : 'citymatica-chart.yml',
            //         type       : javaType,
            //         arch       : 'noarch',
            //         rpm        : true,
            //         rpmSpecFile: 'msp-app.spec',
            // ],
            // [
            //         project    : 'msp-application-awip',
            //         app        : 'msp-application-awip',
            //         repository : 'git@gitlab.alx:mmsp/msp-application-awip.git',
            //         archive    : 'awip.war',
            //         schema     : 'awip',
            //         config     : 'awip.yml',
            //         groupId    : 'ru.main.module',
            //         arch       : 'noarch',
            //         rpm        : true,
            //         rpmSpecFile: 'msp-app.spec',
            //         type       : javaType,
            // ],
            // // Frontend
            // [
            //         project    : 'msp-operator-ui',
            //         app        : 'msp-operator-ui',
            //         repository : 'git@gitlab.alx:msp-ui/operator-ui.git',
            //         archive    : 'operator-ui.tar.gz',
            //         groupId    : 'ru.city.front',
            //         taskName   : 'frontend',
            //         type       : frontendType,
            //         arch       : 'noarch',
            //         rpmSpecFile: 'front.spec',
            //         rpm        : true,
            // ],
            // [
            //         project    : 'msp-admin-ui',
            //         app        : 'msp-admin-ui',
            //         repository : 'git@gitlab.alx:main.0/admin-ui.git',
            //         archive    : 'admin-ui.tar.gz',
            //         taskName   : 'frontend',
            //         groupId    : 'ru.main.front',
            //         type       : frontendType,
            //         arch       : 'noarch',
            //         rpmSpecFile: 'front.spec',
            //         rpm        : true,
            // ],
            // [
            //         project       : 'msp-frontend-ui',
            //         app           : 'msp-frontend-ui',
            //         repository    : 'git@10.20.0.17:citymatica/frontend-web.git',
            //         archive       : 'frontend-ui.tar.gz',
            //         //credentials   : 'e10eff24-c43c-43a3-8dc2-ba8e7517e9bf',
            //         buildDirectory: 'dist',
            //         taskName      : 'frontend',
            //         buildTool     : 'npm',
            //         groupId       : 'ru.city.front',
            //         type          : frontendType,
            //         arch          : 'noarch',
            //         rpmSpecFile   : 'front.spec',
            //         rpm           : true,
            // ],
            // [
            //         project       : 'msp-design-ui',
            //         app           : 'msp-design-ui',
            //         repository    : 'git@gitlab.alx:msp-ui-external/drill-down.git',
            //         archive       : 'design-ui.tar.gz',
            //         buildDirectory: 'storybook-static',
            //         buildCommand  : 'build-storybook',
            //         groupId       : 'ru.city.front',
            //         taskName      : 'frontend',
            //         type          : frontendType,
            // ],
            // // main Java
            // [
            //         project    : 'main',
            //         app        : 'isp-auth-service',
            //         repository : 'git@github.com:integration-system/isp-auth-service.git',
            //         archive    : 'auth-service.tar.gz',
            //         type       : javaType,
            //         artifactJar: true,
            //         taskName   : 'isp2',
            //         groupId    : 'ru.isp2.module',
            //         arch       : 'noarch',
            //         rpmSpecFile: 'auth.spec',
            //         rpm        : true,
            // ],
            // // main Go
            // [
            //         project   : 'main',
            //         app       : 'isp-config-service',
            //         repository: 'git@github.com:integration-system/isp-config-service.git',
            //         archive   : 'isp-config-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'isp2',
            //         groupId   : 'ru.isp2.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'isp-convert-service',
            //         repository: 'git@github.com:integration-system/isp-convert-service.git',
            //         archive   : 'isp-convert-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'isp2',
            //         groupId   : 'ru.isp2.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'isp-routing-service',
            //         repository: 'git@github.com:integration-system/isp-routing-service.git',
            //         archive   : 'isp-routing-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'isp2',
            //         groupId   : 'ru.isp2.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'isp-system-service',
            //         repository: 'git@github.com:integration-system/isp-system-service.git',
            //         archive   : 'isp-system-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'isp2',
            //         groupId   : 'ru.isp2.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-admin-service',
            //         repository: 'git@gitlab.alx:main.0/msp-admin-service.git',
            //         archive   : 'msp-admin-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-user-service',
            //         repository: 'git@gitlab.alx:main.0/msp-user-service.git',
            //         archive   : 'msp-user-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-mongo-backend-service',
            //         repository: 'git@gitlab.alx:main.0/msp-mongo-backend-service.git',
            //         archive   : 'msp-mongo-backend-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-sql-backend-service',
            //         repository: 'git@gitlab.alx:main.0/msp-sql-backend-service.git',
            //         archive   : 'msp-sql-backend-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-mobile-service',
            //         repository: 'git@gitlab.alx:main.0/msp-mobile-service.git',
            //         archive   : 'msp-mobile-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-template-service',
            //         repository: 'git@gitlab.alx:main.0/msp-template-service.git',
            //         archive   : 'msp-template-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-email-service',
            //         repository: 'git@gitlab.alx:main.0/msp-email-service.git',
            //         archive   : 'msp-email-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-file-storage-service',
            //         repository: 'git@gitlab.alx:main.0/msp-file-storage-service.git',
            //         archive   : 'msp-file-storage-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-message-bundle-service',
            //         repository: 'git@gitlab.alx:main.0/msp-message-bundle-service.git',
            //         archive   : 'msp-message-bundle-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-mobile-push-service',
            //         repository: 'git@gitlab.alx:main.0/msp-mobile-push-service.git',
            //         archive   : 'msp-mobile-push-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-rest-backend-service',
            //         repository: 'git@gitlab.alx:main.0/msp-rest-backend-service.git',
            //         archive   : 'msp-rest-backend-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-sms-service',
            //         repository: 'git@gitlab.alx:main.0/msp-sms-service.git',
            //         archive   : 'msp-sms-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-mdm-service',
            //         repository: 'git@gitlab.alx:main.0/msp-mdm-service.git',
            //         archive   : 'msp-mdm-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-mdm-adapter-service',
            //         repository: 'git@gitlab.alx:main.0/msp-mdm-adapter-service.git',
            //         archive   : 'msp-mdm-adapter-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-mdm-api-service',
            //         repository: 'git@gitlab.alx:main.0/msp-mdm-api-service.git',
            //         archive   : 'msp-mdm-api-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-mdm-converter-service',
            //         repository: 'git@gitlab.alx:main.0/msp-mdm-converter-service.git',
            //         archive   : 'msp-mdm-converter-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-mdm-notify-service',
            //         repository: 'git@gitlab.alx:main.0/msp-mdm-notify-service.git',
            //         archive   : 'msp-mdm-notify-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-mdm-search-service',
            //         repository: 'git@gitlab.alx:main.0/msp-mdm-search-service.git',
            //         archive   : 'msp-mdm-search-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-mdm-dumper-service',
            //         repository: 'git@gitlab.alx:main.0/msp-mdm-dumper-service.git',
            //         archive   : 'msp-mdm-dumper-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'msp-mdm-async-api-service',
            //         repository: 'git@gitlab.alx:main.0/msp-mdm-async-api-service.git',
            //         archive   : 'msp-mdm-async-api-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ],
            // [
            //         project   : 'main',
            //         app       : 'mdm-sma-service',
            //         repository: 'git@gitlab.alx:main.0/mdm-sma-service.git',
            //         archive   : 'mdm-sma-service.tar.gz',
            //         type      : goType,
            //         taskName  : 'main',
            //         groupId   : 'ru.main.module',
            //         arch      : 'x86_64',
            //         rpm       : true,
            // ]
            [
                    project    : 'main',
                    app        : 'fishtravel-admin',
                    repository : 'git@gitlab.tracker.fish:development/fishtravel-admin.git',
                    archive    : 'fishtravel-admin.gz',
                    type       : goType,
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
        projectTypes.add(tomcatType)
        projectTypes.add(nginxType)
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


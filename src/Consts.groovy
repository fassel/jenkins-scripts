class Consts {

    // ----- JOB NAMES -----
    static String deployAppJobName = 'deploy-app'
    static String publishInstallationJobName = 'publish-installation'
    static String publishReleaseJobName = 'publish-release'
    static String buildRpmJobName = 'publish-rpm'
    static String tomcatRpmJobName = 'tomcat-build-publish'
    static String nginxRpmJobName = 'nginx-build-publish'
    static String defaultPrefixAutoJobName = 'city'
    static String mainGenerateDslJobName = 'tech-auto-dsl'

    // ----- NEXUS -----
    static String nexusUrl = 'https://nexus.tracker.fish'
    static String releaseRepository = 'maven-releases'
    static String snapshotRepository = 'maven-snapshots'
    static String devopsReleaseRepository = 'ru/devops/release'
    static String rpmRepositorySearch = 'yum'
    static String rpmSnapshotRepositorySearch = 'yum-snapshots'
    static String rpmRepository = "${rpmRepositorySearch}/main"
    static String rpmSnapshotRepository = "${rpmSnapshotRepositorySearch}/main"
    static String nexusUser = 'asavchuk'
    static String nexusPassword = 'nUQBQFoYp7pn3jnaBzhed2hq'
    static String nexusCredentials = "${nexusUser}:${nexusPassword}"

    // ----- CREDENTIALS -----
    static String telegramCredential = '6e162f45-d771-4051-a661-b75363dc252b'
    static String defaultTelegramSocks5Credential = '4e0662c7-3460-487d-a6bf-618c28c48986'
    static String mp3DeployerCredential = 'd9913e49-f3a6-4648-8b76-8cf9f1da50be'
    static String nexusMp3DeployerCredential = 'nexus-mp3deployer-user'
    //static String mpDeployerCredential = '3c354c64-fabe-45ab-9bd7-dcde9b321711'

    // ----- TELEGRAM -----
    static String defaultTelegramChat = '-265721608'

    // ----- GIT -----
    static String gitDeliveryConfiguration = 'git@gitlab.alx:devops/msp-delivery-configuration.git'
    static String gitDeliveryVersion = 'git@gitlab.alx:devops/msp-delivery-version.git'
    static String gitApplicationConfigs = 'git@10.20.0.17:devops/app-configs.git'
    static String gitJenkinsLibraryBranch = 'master'

    // ----- JENKINS TOOLS -----
    static String gradleToolName = 'G431'
    static String goToolName = 'goland'
    static String dockerToolName = 'docker'
    static String nodeToolName = 'nodeJs'
    static String mavenToolName = 'maven'

    // ----- DEPLOY -----
    static String deployAsArchive = 'deployAsArchive'
    static String deployAsRpm = 'deployAsRpm'
    static String deployAsDocker = 'deployAsDocker'
    static String deployAsTomcatArtifact = 'deployAsTomcatArtifact'

    // ----- OTHERS -----
    static String goVersionFile = '.version'
    static String jenkinsLibraryName = 'devops-delivery'
    static String jenkinsLibrary = "${jenkinsLibraryName}@${gitJenkinsLibraryBranch}"
    static String executeAfterDeployFileName = "post-deploy.sh"
    static String publishJavaFileName = "publish.gradle"
    static String javaVersionFileName = "gradle.properties"
}

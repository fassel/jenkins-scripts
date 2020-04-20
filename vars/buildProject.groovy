#!/usr/bin/env groovy
import AppConfiguration
import Consts

def call(String app, String branch, String version, String archive) {

    def applicationType = AppConfiguration.getTypeByApp(app)
    def repository = AppConfiguration.isSnapshot(branch) ? Consts.snapshotRepository : Consts.releaseRepository

    if (applicationType == AppConfiguration.frontendType) {
        buildFrontend(app, version, archive, AppConfiguration.isSnapshot(branch))
    } else if (applicationType == AppConfiguration.goType) {
        buildGo(app, version, archive)
    } else if (applicationType == AppConfiguration.javaType) {
        buildJava(app, false, repository == Consts.snapshotRepository)
    } else {
        currentBuild.result = 'FAILURE'
        currentBuild.description = "Unknown application type $applicationType"
    }
}

def buildGo(app, version, archive) {
    withGolang(Consts.mp3DeployerCredential) {
        def flags = "-X main.version=${version} -X main.date=${new Date().format("yyyy-MM-dd'T'HH:mm:ss")}"
        sh "rm -rf \${GOPATH}/src/${app}/vendor"
        sh 'git config --global url."git@github.com:".insteadOf "https://github.com/"'
        sh 'git config --global url."git@gitlab.alx:".insteadOf "http://gitlab.alx/"'
        sh 'go get -u github.com/integration-system/dep/cmd/dep'
        sh "cd \${GOPATH}/src/${app} && \${GOPATH}/bin/dep ensure -v -vendor-only && CGO_ENABLED=0 GOOS=linux go build -installsuffix cgo -v -ldflags=\"${flags}\""

        println 'Create tar archive'
        sh("rm -Rf \${GOPATH}/src/${app}/build && rm -Rf \\${GOPATH}/src/${app}/archive")
        sh("mkdir -p \${GOPATH}/src/${app}/archive && mkdir -p \${GOPATH}/src/${app}/build")
        sh("cp -R \${GOPATH}/src/${app}/static            \${GOPATH}/src/${app}/build/static          | true")
        sh("cp -R \${GOPATH}/src/${app}/migrations        \${GOPATH}/src/${app}/build/migrations      | true")
        sh("cp -R \${GOPATH}/src/${app}/migrations_temp   \${GOPATH}/src/${app}/build/migrations_temp | true")
        sh("cp \${GOPATH}/src/${app}/conf/config.yml      \${GOPATH}/src/${app}/build/config.yml      | true")
        sh("cp \${GOPATH}/src/${app}/conf/config_test.yml \${GOPATH}/src/${app}/build/config_test.yml | true")
        sh("cp \${GOPATH}/src/${app}/$app                 \${GOPATH}/src/${app}/build/$app")
        sh("tar -C \${GOPATH}/src/${app}/build -cvzf      \${GOPATH}/src/${app}/archive/${archive} .")
    }
}

def buildFrontend(app, version, archive, isSnapshot) {
    def buildDirectory = AppConfiguration.getBuildDirectory(app)
    def buildCommand = isSnapshot ? AppConfiguration.getBuildDevCommand(app) : AppConfiguration.getBuildCommand(app)
    def buildTool = AppConfiguration.getBuildTool(app)

    env.NODEJS_HOME = "${tool Consts.nodeToolName}"
    env.PATH = "${env.NODEJS_HOME}/bin:${env.PATH}"
    sh("rm -Rf ${WORKSPACE}/${buildDirectory} && rm -Rf ${WORKSPACE}/archive")
    sh("mkdir -p ${WORKSPACE}/${buildDirectory} && mkdir -p ${WORKSPACE}/archive")
    sh "${buildTool} --version"
    sh "${buildTool} --ignore-engines install"
    sh "${buildTool} --ignore-engines run ${buildCommand}"
    println "tar -C ${WORKSPACE}/${buildDirectory} -cvzf ${WORKSPACE}/archive/${archive} ."
    sh("tar -C ${WORKSPACE}/${buildDirectory} -cvzf ${WORKSPACE}/archive/${archive} .")
    /*writeFile file: 'Dockerfile', text: dockerfile()

    sh("${tool Consts.dockerToolName} build -t \"${app}:1\" .")
    sh("${tool Consts.dockerToolName} run --rm -v `pwd`/${app}:/tmp ${app}:1 sh -c \"cp -r /root/${buildDirectory}/* /tmp\" ")
    sh("tar -zcvf ${app}.tar.gz ${app}/")
    sh("${tool Consts.dockerToolName} run --rm -v `pwd`/${app}:/tmp ${app}:1 sh -c \"rm -Rf /tmp/*\"")
    */
}

def buildJava(app, testing, isSnapshot) {
    println "Build project $app"
    def version = readFile("${WORKSPACE}/${Consts.javaVersionFileName}").trim()
    if (isSnapshot) {
        version += '-SNAPSHOT'
        writeFile file: "${WORKSPACE}/${Consts.javaVersionFileName}", text: version
    }
    println "Version: ${version}"
    if (currentBuild.description) {
        currentBuild.description = currentBuild.description + " ${app}:${version}"
    } else {
        currentBuild.description = "${app}:${version}"
    }
    if (app == AppConfiguration.adminAppName) {
        sh("./gradlew -x test -x jooq-codegen-primary")
    }

    if (testing) {
        sh("${tool Consts.gradleToolName}/bin/gradle clean build")
    } else {
        sh("${tool Consts.gradleToolName}/bin/gradle clean assemble")
    }
}

def dockerfile(String task = "build") {
    """ FROM node:8-alpine AS builder
        WORKDIR /root
        COPY package.json .
        RUN npm install 
        COPY . .
        RUN npm run $task
    """.stripIndent()
}


return this

#!/usr/bin/env groovy

def call(String app, boolean runTests = true, boolean runIntegrationTests = true) {
    withGolang(Consts.mp3DeployerCredential) {
        if (runTests) {
            sh "cd \${GOPATH}/src/${app} && APP_CONFIG_PATH=./conf DOCKER_HOST_MACHINE=${env.DOCKER_HOST_MACHINE} CGO_ENABLED=0 go test ./... -test.short=${!runIntegrationTests}"
        }
    }
}

return this


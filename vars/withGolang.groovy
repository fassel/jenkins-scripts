#!/usr/bin/env groovy
import Consts

/**
 * credentials - used to resolve dependencies from gitlab.alx
 */
def call(String credentials, Closure body) {
    def golangTool = tool name: Consts.goToolName, type: 'go'

    sshagent(credentials: [credentials]) {
        withEnv(["GOROOT=${golangTool}", "PATH+GO=${golangTool}/bin:${home}/go/bin", "GOPATH=${workspace}"]) {
            sh ("go version")
            body()
        }
    }
}

return this

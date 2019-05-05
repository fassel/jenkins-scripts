#!/usr/bin/env groovy
import Consts

def call(String domain, String project, String version, String arch) {
    println "Rpm download ${domain} ${project}:${version}"

    def rpm = "${project}-${version}-0.${arch}.rpm"
    sh("curl -v -k -u ${Consts.nexusCredentials} --fail -O ${Consts.nexusUrl}/repository/${Consts.rpmRepository}/${rpm}")

}

return this

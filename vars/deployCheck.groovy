#!/usr/bin/env groovy
import AppConfiguration
import EnvConfiguration

def call(app, domain) {

    def hostParams = EnvConfiguration.findHost(domain)
    def host = hostParams.host
    if (host == null) {
        currentBuild.result = 'FAILURE'
        currentBuild.description = "Unknown domain name $domain"
        throw new RuntimeException("Unknown domain name $domain")
    }

    def archive = AppConfiguration.findArchiveByApp(app)
    if (archive == null) {
        currentBuild.result = 'FAILURE'
        currentBuild.description = "Unknown archive name $archive"
        throw new RuntimeException("Unknown archive name $archive")
    }

    def path = archive.substring(0, archive.lastIndexOf('.')).replace('#', '/')

    def tomcatPort = hostParams.tomcatPort ? hostParams.tomcatPort : EnvConfiguration.tomcatDefaultPort
    def tomcatCredential = hostParams.tomcatCredential ? hostParams.tomcatCredential : EnvConfiguration.tomcatDefaultCredential
    if (tomcatCredential == null) tomcatCredential = ''
    else tomcatCredential = "--user ${tomcatCredential}"

    def remote = [:]
    remote.name = host
    remote.host = host
    remote.allowAnyHosts = true

    //def sshCmd = "ssh -t -t -o ConnectTimeout=300 -o BatchMode=yes -o StrictHostKeyChecking=no mp3deployer@${host} '/bin/bash -c \"${cmd}\"' "
    def repeatCountTemp = 20
    def repeatCount = 20

    withCredentials([sshUserPrivateKey(credentialsId: Consts.mp3DeployerCredential, keyFileVariable: 'identity', passphraseVariable: '', usernameVariable: 'userName')]) {
        remote.user = userName
        remote.identityFile = identity

        while ({
            sleep 10
            def result = sshCommand remote: remote, command: "curl ${tomcatCredential} http://${host}:${tomcatPort}/manager/text/list"
            result = result
                    .trim().split('\n')
                    .find { it.startsWith("/${path}") } // this just hack
            println result
            --repeatCount
            println "Check deploy attempt: ${repeatCountTemp - repeatCount}"
            repeatCount > 0 && (!result || !result.contains(":running:"))
        }()) continue
    }

    if (repeatCount < 1) {
        currentBuild.result = 'FAILURE'
        currentBuild.description = "Tomcat could not deploy $app"
        throw new RuntimeException("Tomcat could not deploy $app")
    }
}

return this

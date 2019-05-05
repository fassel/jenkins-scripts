#!/usr/bin/env groovy
import EnvConfiguration
import Consts

def call(String app, String domain, String archive) {

    def hostParams = EnvConfiguration.findHost(domain)
    def host = hostParams.host
    def tomcatPort = hostParams.tomcatPort ? hostParams.tomcatPort : EnvConfiguration.tomcatDefaultPort
    println "Undeploy $app $domain $host $hostParams $tomcatPort"

    def tomcatCredential = hostParams.tomcatCredential ? hostParams.tomcatCredential : EnvConfiguration.tomcatDefaultCredential
    if (tomcatCredential == null) tomcatCredential = ''
    else tomcatCredential = "--user ${tomcatCredential}"

    def path = archive.substring(0, archive.lastIndexOf('.')).replace('#', '/')

    def remote = [:]
    remote.name = host
    remote.host = host
    remote.allowAnyHosts = true

    withCredentials([sshUserPrivateKey(credentialsId: Consts.mp3DeployerCredential, keyFileVariable: 'identity', passphraseVariable: '', usernameVariable: 'userName')]) {
        remote.user = userName
        remote.identityFile = identity
        sshCommand remote: remote, command: "curl ${tomcatCredential} http://${host}:${tomcatPort}/manager/text/stop?path=/${path}"
        sshCommand remote: remote, command: "curl ${tomcatCredential} http://${host}:${tomcatPort}/manager/text/undeploy?path=/${path}"
    }

}

return this

#!/usr/bin/env groovy

import EnvConfiguration

def call(String domain, String project, String version, String arch) {
    println "Rpm install ${domain} ${project}:${version}"

    def host = EnvConfiguration.findHost(domain).host
    if (host == null) {
        currentBuild.result = 'FAILURE'
        currentBuild.description = "Unknown domain name $domain"
        return
    }

    def username = 'mp3deployer'
    def rpmLocation = '/tmp'

    def rpm = "${project}-${version}-0.${arch}.rpm"

    def options = "-o ConnectTimeout=300 -o BatchMode=yes -o StrictHostKeyChecking=no"
    def command = "sudo rpm -Uvh ${rpmLocation}/${rpm}"

    sh("scp $options ${rpm} ${username}@${host}:${rpmLocation}/ ")
    sh("ssh $options -t -t ${username}@${host} '${command}'")
}

return this

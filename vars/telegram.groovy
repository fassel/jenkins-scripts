#!/usr/bin/env groovy

import groovy.json.JsonOutput

def call(chat, credentials, proxyCredential, smile, status, text) {

    withCredentials([
            string(credentialsId: credentials, variable: 'TOKEN'),
            string(credentialsId: proxyCredential, variable: 'PROXY_SETTINGS')
    ]) {

        def url = "https://api.telegram.org/bot${TOKEN}/sendMessage"
        def message = "${smile ? (smile + ' ') : ''}<b>${status}</b>\n${text}"
        def payload = JsonOutput.toJson([chat_id : chat, text : message, parse_mode : 'html'])

        def proxySettings = PROXY_SETTINGS ? " -x ${PROXY_SETTINGS}" : ''

        sh ("curl -v${proxySettings} POST -d '${payload}' -H 'Content-Type: application/json' ${url}")
    }
}

return this

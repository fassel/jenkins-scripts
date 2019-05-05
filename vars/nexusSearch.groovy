//curl --user 'mp3deployer:ScjKLQuvqfAXu2bs8ysLAvRt' -X GET
//"https://nexus.msp.mobi/service/rest/v1/search?repository=msp-yum&name=msp-application-awiptogrpc-adapter&format=yum"
// -H "accept: application/json"

import groovy.json.JsonSlurper

def application = 'config-service'

def nexusUsername = 'mp3deployer'
def nexusPassword = 'ScjKLQuvqfAXu2bs8ysLAvRt'
def nexusApiUrl = 'https://nexus.msp.mobi/service/rest/v1/search'

def authorization = "${nexusUsername}:${nexusPassword}".getBytes().encodeBase64().toString()
def connection = new URL("$nexusApiUrl?repositoryr&format=yum&name=$application")
        .openConnection() as HttpURLConnection

connection.setRequestProperty('Authorization', 'Basic ' + authorization)
connection.setRequestProperty('User-Agent', 'groovy-2.4.4')
connection.setRequestProperty('Accept', 'application/json')

if (connection.responseCode == 200) {
    def json = connection.inputStream.withCloseable { inStream ->
        new JsonSlurper().parse(inStream as InputStream)
    }

    def items = []
    items =  json.items?.collect { it ->
        println "Item ${it.version}"
        return "${it.version}"
    }

    return items

} else {
    println connection.responseCode + ": " + connection.inputStream.text
}
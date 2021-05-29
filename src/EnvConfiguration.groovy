class EnvConfiguration {

    static String defaultDeployPath = '/opt/citymatica-stage/web'
    static String defaultRpmDeployPath = '/tmp'
    static String defaultTomcatDeployPath = '/opt/citymatica-stage/tomcat/webapps'
    static String tomcatDefaultCredential = 'cityadmin:cbnbflvby'
    static String tomcatDefaultPort = '18080'

    static Map<String, String> hosts = [
            // stage name
            'dev.tracker.fish' : [
                    host         : 'dev.tracker.fish',
                    deployPath   : '/var/www',
                    jarDeployPath: '/opt/linga',
            ],
            'dev.linga.io' : [
                    host         : 'dev.linga.io',
                    deployPath   : '/var/www',
                    jarDeployPath: '/opt/linga',
            ],
            'prod.tracker.fish': [
                    host         : 'prod.tracker.fish',
                    deployPath   : '/var/www',
                    jarDeployPath: '/opt/linga',
            ],
            'prod.linga': [
                    host         : 'linga.io',
                    deployPath   : '/var/www',
                    jarDeployPath: '/opt/linga',
            ],
            /*'msp2-dev-117'                    : [
                    // Host ip or domain
                    host            : '10.250.9.117',
                    // Path for deploy application
                    deployPath      : defaultDeployPath,
                    // Path for deploy rpm package
                    rpmDeployPath   : defaultRpmDeployPath,
                    // Path for deploy war (java) application
                    warDeployPath   : defaultTomcatDeployPath,
                    // Login and password for tomcat
                    tomcatCredential: tomcatDefaultCredential,
                    // Tomcat port
                    tomcatPort      : tomcatDefaultPort,
            ],*/
    ]

    static def findHost(domain) {
        return hosts.get(domain)
    }

    static def hostList() {
        return hosts.values().stream().map { params -> params.host }.toList()
    }

    static def domainList() {
        return hosts.keySet().toList()
    }

    static void main(String... args) {
        String tt = "msp-dev"
        println host('msp-dev')
        println '---'
        println host(tt)
    }

}

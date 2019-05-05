class EnvConfiguration {

    static String defaultDeployPath = '/opt/citymatica-stage/web'
    static String defaultRpmDeployPath = '/tmp'
    static String defaultTomcatDeployPath = '/opt/citymatica-stage/tomcat/webapps'
    static String tomcatDefaultCredential = 'cityadmin:cbnbflvby'
    static String tomcatDefaultPort = '18080'

    static Map<String, String> hosts = [
            // stage name
            'hosting.msp.mobi'                : [
                    host      : 'hosting.msp.mobi',
                    deployPath: '/var/www',
            ],
            'msp2-dev-117'                    : [
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
            ],
            'mspgo-alpha'                     : [
                    host         : '10.250.9.38',
                    warDeployPath: '/opt/msp/msp-tomcat/webapps',
                    tomcatPort   : '8080',
            ],
            'msp2test'                        : [
                    host         : '10.250.9.36',
                    warDeployPath: '/opt/msp/msp-tomcat/webapps',
                    deployPath   : '/opt/msp/msp-nginx/front',
                    tomcatPort   : '8080',
            ],
            'msp2mdm'                         : [
                    host: '10.250.9.40',
            ],
            'mdm-taxcom-test'                 : [
                    host: '10.250.9.47',
            ],
            'mdm-test-app-1(60)'              : [
                    host: '195.201.216.60',
            ],
            'mdm-test-app-2(66)'              : [
                    host: '195.201.216.66',
            ],
            'msp2-dev-114'                    : [
                    host      : '10.250.9.114',
                    deployPath: '/opt/msp2'
            ],
            'msp-dev'                         : [
                    host: '10.250.9.33',
            ],
            'msp-test'                        : [
                    host: '10.250.9.34',
            ],
            'msp-alpha'                       : [
                    host: '10.250.9.35',
            ],
            'ladpc.citymatica.com'            : [
                    host: '10.20.0.16',
            ],
            'es.citymatica.com'               : [
                    host: '94.130.230.217',
            ],
            'demo.citymatica.com'             : [
                    host: '195.201.135.78',
            ],
            'demo2.citymatica.com'            : [
                    host: '159.69.14.44',
            ],
            'valedopinhao.citymatica.com'     : [
                    host: '195.201.117.176',
            ],
            'ramat-gan.citymatica.com'        : [
                    host: '195.201.129.11',
            ],
            'recriesuacidade.citymatica.com'  : [
                    host: '195.201.130.99',
            ],
            'heb.citymatica.com'              : [
                    host: '195.201.130.100',
            ],
            'sao-tome.citymatica.com'         : [
                    host: '195.201.136.194',
            ],
            'myparanaque.citymatica.com'      : [
                    host: '195.201.225.22',
            ],
            'tesla.citymatica.com'            : [
                    host: '195.201.220.128',
            ],
            'mupa.citymatica.com'             : [
                    host: '159.69.9.230',
            ],
            'angelcontlalpan.citymatica.com'  : [
                    host: '159.69.25.93',
            ],
            'atg.citymatica.com'              : [
                    host: '159.69.37.194',
            ],
            'betim.citymatica.com'            : [
                    host: '159.69.17.49',
            ],
            'gorod1.citymatica.com'           : [
                    host: '195.201.38.151',
            ],
            'tver.citymatica.com'             : [
                    host: '195.201.225.24',
            ],
            'bhachau.citymatica.com'          : [
                    host: '195.201.39.7',
            ],
            'mybarangaysocorro.citymatica.com': [
                    host: '159.69.196.80',
            ],
            'digital.city-ru.ru'              : [
                    host: '159.69.203.202',
            ],
            'mehsana.citymatica.com'          : [
                    host: '159.69.205.57',
            ],
            'tocancipa.citymatica.com'        : [
                    host: '195.201.129.11',
            ],
            'riorande.citymatica.com'         : [
                    host: '195.201.130.99',
            ],
            'vadnagar.citymatica.com'         : [
                    host: '159.69.203.57',
            ],
            'indigo.citymatica.com'           : [
                    host: '116.203.72.24',
            ],
            'brumadinho.citymatica.com'       : [
                    host: '116.203.58.218',
            ],
            'girya.citymatica.com'            : [
                    host: '195.201.34.246',
            ]
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

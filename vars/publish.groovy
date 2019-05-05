#!/usr/bin/env groovy
import AppConfiguration

def call(String app, String branch, String version, String archive, Boolean artifactJar) {

    def applicationType = AppConfiguration.getTypeByApp(app)
    def groupId = AppConfiguration.getGroupIdByApp(app)
    def repository = AppConfiguration.isSnapshot(branch) ? Consts.snapshotRepository : Consts.releaseRepository

    if (applicationType == AppConfiguration.frontendType) {
        publishFrontend(app, groupId, version, archive, repository)
    } else if (applicationType == AppConfiguration.goType) {
        publishGo(app, groupId, version, archive, repository)
    } else if (applicationType == AppConfiguration.javaType) {
        def publishScriptPath = AppConfiguration.getPublishScriptPath(app)
        def artifactsDirectories = AppConfiguration.getArtifactsDirectories(app)
        publishJava(repository, artifactsDirectories, publishScriptPath, app, artifactJar)
    } else {
        currentBuild.result = 'FAILURE'
        currentBuild.description = "Unknown application type $applicationType"
        return
    }
}

def publishJava(repository, artifactsDirectories, publishScriptPath, app, artifactJar) {
    println "WRITE PUBLISH FILE: ${publishScriptPath}${Consts.publishJavaFileName}"
    writeFile file: "${publishScriptPath}${Consts.publishJavaFileName}",
            text: artifactJar ? gradlePublishScriptJar(repository, app) : gradlePublishScriptWar(repository, app)
    def result = sh(
            script: "${tool Consts.gradleToolName}/bin/gradle publish -x test -x build 2>&1 | tee publish.log",
            returnStdout: true
    )
    println result
    //checkGradlePublishResponse(result)
    return getArtifacts(artifactsDirectories, artifactJar)
}

def publishGo(app, groupId, version, archive, repository) {
    def result = sh(script: "curl -v -k -u '${Consts.nexusCredentials}' --upload-file ${WORKSPACE}/src/${app}/archive/${archive} " +
            "${Consts.nexusUrl}/repository/${repository}/${groupId}/${app}/${version}/${archive} 2>&1",
            returnStdout: true
    )
    println result
    checkCurlResponse(result)
    return [['path': "${WORKSPACE}/src/${app}/archive/${archive}", version: version, name: archive]]
//    def mavenScript = """
//            ${tool Consts.mavenToolName}/bin/mvn deploy:deploy-file
//                -Durl=${Consts.nexusUrl}/repository/${repository}
//                -DrepositoryId=${repository}
//                -DgroupId=${groupId}
//                -DartifactId=${app}
//                -Dversion=${version}
//                -DgeneratePom=false
//                -Dpackaging=tar.gz
//                -Dfile=${WORKSPACE}/src/${app}/archive/${archive}
//            """.replaceAll(/\n\s*/, " ")
//
//    sh("$mavenScript 2>&1 | tee publish.log")
//
//    return "${Consts.nexusUrl}/repository/${repository}/${groupId}/${app}/${version}/${archive}"
}

def publishFrontend(app, groupId, version, archive, repository) {
    def result = sh(script: "curl -v -k -u '${Consts.nexusCredentials}' --upload-file ${WORKSPACE}/archive/${archive} " +
            "${Consts.nexusUrl}/repository/${repository}/${groupId}/${app}/${version}/${archive} 2>&1",
            returnStdout: true)
    println result
    checkCurlResponse(result)
    return [['path': "${WORKSPACE}/archive/${archive}", version: version, name: archive]]
}

def checkGradlePublishResponse(response) {
    if (!response.contains('BUILD SUCCESSFUL')) {
        currentBuild.result = 'FAILURE'
        currentBuild.description = "Gradle error"
    }
}

def checkCurlResponse(response) {
    if (!response.contains('HTTP/1.1 201') && !response.contains('HTTP/2 201')) {
        def matcher = response =~ /(HTTP.*\d{3}.*)/
        while (matcher.find()) {
            currentBuild.result = 'FAILURE'
            currentBuild.description = "Nexus error: ${matcher.group()}"
        }
    }
}

def getArtifacts(artifactsDirectories, artifactJar) {
    println 'Parse archives: BEGIN'
    List<Map<String, String>> results = new ArrayList<>()

    for (String artifactsDirectory : artifactsDirectories) {
        def dir = new File("${WORKSPACE}/${artifactsDirectory}")
        for (File file : dir.listFiles()) {
            if (!file.name.endsWith("full.war")
                    && (((file.name.endsWith(".jar") && artifactJar) ||  file.name.endsWith(".war") || file.name.endsWith(".tar.gz")))) {
                results.add([
                        'path'   : "${WORKSPACE}/${artifactsDirectory}${file.name}",
                        'version': "${parseVersion(file.name)}",
                        'name'   : file.name,
                ])
            }
        }
    }

    return results
}

def parseVersion(url) {
    def matcher = url =~ /[\w-]+-([0-9_\\.-]+)(-SNAPSHOT)?.(jar|war|tar.gz)/
    if (matcher.matches()) {
        return matcher[0][1]
    }

    return 'unknown'
}

def gradlePublishScriptWar(String repository, String artifactName) {
    """ apply plugin: "maven-publish"
        def nexusCurrent   = "${Consts.nexusUrl}/repository/${repository}"
        publishing {
            repositories {
                maven {
                    url nexusCurrent
                    credentials {
                        username '${Consts.nexusUser}'
                        password '${Consts.nexusPassword}'
                    }
                }
            }
            publications {
                mavenJava(MavenPublication) {
                    // standard jar
                    from components.web
        
                    artifactId = "${artifactName}"
        
                    def artifactFile = file("\${buildDir}/libs/\${project.name}-\${project.version}-\${bootRepackage.classifier}.war")
                    if (artifactFile.exists()){
                        artifact source: artifactFile, classifier: "\${bootRepackage.classifier}"
                    }
                }
            }
        }
        tasks.withType(PublishToMavenRepository) {
            dependsOn assemble, test
        }

    """.stripIndent()
}

def gradlePublishScriptJar(String repository, String artifactName) {
    """ apply plugin: "maven-publish"
        def nexusCurrent   = "${Consts.nexusUrl}/repository/${repository}"
        publishing {
            repositories {
                maven {
                    url nexusCurrent
                    credentials {
                        username '${Consts.nexusUser}'
                        password '${Consts.nexusPassword}'
                    }
                }
            }
            publications {
                mavenJava(MavenPublication) {
                    // standard jar
                    artifactId = "${artifactName}"
        
                    def artifactFile = file("\${buildDir}/libs/\${project.name}-\${project.version}.jar")
                    if (artifactFile.exists()){
                        artifact source: artifactFile
                    }
                }
            }
        }
        tasks.withType(PublishToMavenRepository) {
            dependsOn assemble, test
        }

    """.stripIndent()
}

return this

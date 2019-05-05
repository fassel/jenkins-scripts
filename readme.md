# Проект msp-delivery-version.

## Approvals:

```
method groovy.json.JsonSlurperClassic parseText java.lang.String
method groovy.lang.GroovyObject invokeMethod java.lang.String java.lang.Object
method java.io.File getName
method java.io.File listFiles
method java.lang.Class getClassLoader
method java.lang.Process waitFor
new groovy.json.JsonSlurperClassic
new java.io.ByteArrayOutputStream int
new java.io.File java.lang.String
staticMethod org.codehaus.groovy.runtime.DefaultGroovyMethods execute java.util.List
staticMethod org.codehaus.groovy.runtime.DefaultGroovyMethods getText java.io.InputStream
staticMethod org.codehaus.groovy.runtime.ProcessGroovyMethods consumeProcessOutput java.lang.Process java.io.OutputStream java.io.OutputStream
staticMethod org.codehaus.groovy.runtime.ProcessGroovyMethods getErr java.lang.Process
```

## Plugins:
```
Job DSL
Active Choices Plug-in
Pipeline Utility Steps Plugin
SSH Pipeline Steps
GO
```

## Main task:
```
jenkins settings -> configuration -> Global Pipeline Libraries
name: devops-delivery
Project Repository: git@gitlab8.alx:devops/msp-delivery-configuration.git
```

------------------ OLD --------------------
Репозиторий:
git@gitlab.alx:devops/msp-delivery-version.git

Описание:
Содержит актульные версии приложений, адреса для скачивания и настройки деплоя.

Структура проекта:

Уникальные наборы приложений для деплоя (stable - master , unstable - develop)
./installation-stable.txt
./installation-unstable.txt

Файлы создаются для каждого приложения и содержат наборы последних 10 билдов
./projects/${application}-${branch}.txt



Проект msp-delivery-configuration.

Репозиторий:
git@gitlab.alx:devops/msp-delivery-configuration.git

Описание:
Проект содержит jenkins dsl скприпты, а также настроки docker-compose и скрипты развертывания

Структура проекта:

*_job.groovy - dsl скрипты для настройки job'ов в jenkinse


publish_install_job.groovy - публикация архива с базовым пакетом насроек окружения
publish_release_job.groovy - периодическое (или ручное) создание релиза. (Будет описано ниже)

app_publish_job.groovy - 


Создание релиза:



Just commands

PSQL="pg_dump -h citymatica-pgsql.msp.mobi -U myparanaque -d myparanaque -c --if-exists --no-owner --file=/tmp/myparanaque.sql"
docker run --rm -v pg:/tmp postgres:9.6.8-alpine sh -c "PGPASSWORD=JXcnkxjUkqN68Y7gy45uo2o7 $PSQL"

PSQL="psql -q -h citymatica-pgsql.msp.mobi -d mupa -U mupa  -f /tmp/myparanaque.sql"
docker run --rm -v pg:/tmp postgres:9.6.8-alpine sh -c "PGPASSWORD=x6qBsem7iTa5VC8vu77tGJ9i $PSQL"


pg_dump -Fc -d myparanaque -c --if-exists --no-owner --file=/tmp/myparanaque.dump
pg_restore --no-owner --role=mupa -d mupa /tmp/myparanaque.dump

node {

    def shCreds = '53c15fb1-b54c-4560-bee3-58f3c676431e'
    def gitCreds = '3c354c64-fabe-45ab-9bd7-dcde9b321711'

    stage('execute') {
        git url: 'git@gitlab.alx:mmsp/devops.git', branch: 'master', credentialsId: gitCreds

        dir('ansible') {
            ansiblePlaybook(
                installation: 'ansible',
                credentialsId: shCreds,
                inventory: '../inventory.yml',
                playbook: params.script,
                extraVars: ['host' : params.stage, 'user': 'mp3deployer'],
                disableHostKeyChecking: true,
                colorized: true
            )
        }
    }
}    

def Consts = this.class.classLoader.parseClass(this.readFileFromWorkspace('src/Consts.groovy'))

listView('city-build-view') {
    description('Jobs for citymatica')
    jobs {
        regex(/city-build.+/)
    }
    columns {
        name()
        status()
        lastDuration()
        lastSuccess()
        lastFailure()
        buildButton()
    }
}

listView('city-tech-view') {
    description('Jobs for citymatica')
    jobs {
        //regex(/city-tech.+/)
        name(Consts.mainGenerateDslJobName)
        name(Consts.buildRpmJobName)
        name(Consts.publishReleaseJobName)
        name(Consts.publishInstallationJobName)
        name(Consts.deployAppJobName)
        //name(Consts.tomcatRpmJobName)
        //name(Consts.nginxRpmJobName)
    }
    columns {
        name()
        status()
        lastDuration()
        lastSuccess()
        lastFailure()
        buildButton()
    }
}

/*listView('city-external') {
    description('Jobs for external projects')
    jobs {
        regex(/city-external.+/)
    }
    columns {
        name()
        status()
        lastDuration()
        lastSuccess()
        lastFailure()
        buildButton()
    }
}*/

listView('main-build') {
    description('Jobs for main')
    jobs {
        regex(/(m|i)ain-build.+/)
    }
    columns {
        name()
        status()
        lastDuration()
        lastSuccess()
        lastFailure()
        buildButton()
    }
}

listView('frontend-build') {
    description('Jobs for front')
    jobs {
        regex(/frontend-build.+/)
    }
    columns {
        name()
        status()
        lastDuration()
        lastSuccess()
        lastFailure()
        buildButton()
    }
}

#!/usr/bin/env node

// npm install shelljs inquirer

const GITLAB_TOKEN = 'KtY4d6Le99Moq7q6pPeA';
const GITLAB_URL = 'gitlab.alx';
const GITLAB_GROUP_PATH = `/api/v4/groups/369`;

const JENKINS_URL = 'http://jenkins.msp.mobi:8181';
const JENKINS_PATH = project => `/job/msp2-build-publish-${project}-auto/build`;
const JENKINS_USER = 'Admin';
const JENKINS_TOKEN = '11c0230f223150c2c75e8aa441d7c9ba30';
//const JENKINS_AUTH = 'Basic ' + Buffer.from(JENKINS_USER + ':' + JENKINS_TOKEN).toString('base64');

const inquirer = require('inquirer');
const http = require('http');
const fs = require('fs');
const shell = require('shelljs');


const options = {
    port:    80,
    method:  'GET',
    host:    GITLAB_URL,
    path:    GITLAB_GROUP_PATH,
    headers: {
        'PRIVATE-TOKEN': GITLAB_TOKEN,
    },
};
const EXCLUDE_PROJECTS = {
    'msp-lib':      true,
    'msp-mdm-lib':  true,
    'admin-ui':     true,
    'auth-service': true,
};

const getProjects = async () => {
    const result = await new Promise((resolve, reject) => {
        http
            .get(options, resp => {
                let data = '';
                resp.on('data', (chunk) => {
                    data += chunk;
                });
                resp.on('end', () => {
                    resolve(JSON.parse(data));
                });
            })
            .on('error', err => reject(err));
    });
    return result;
};

const rmDir = function (dir, rmSelf) {
    let files;
    rmSelf = (rmSelf === undefined) ? true : rmSelf;
    dir = dir + '/';
    try {
        files = fs.readdirSync(dir);
    } catch (e) {
        console.log('!Oops, directory not exist.');
        return;
    }
    if (files.length > 0) {
        files.forEach(function (x, i) {
            if (fs.statSync(dir + x).isDirectory()) {
                rmDir(dir + x);
            } else {
                fs.unlinkSync(dir + x);
            }
        });
    }
    if (rmSelf) {
        // check if user want to delete the directory ir just the files in this directory
        fs.rmdirSync(dir);
    }
};

const writeFile = (filePath, data) => {
    fs.writeFileSync(filePath, data, {flag: 'a'});
};

const executeShellCommand = (title, command, project, cwd, gopath) => {
    const logFile = `${__dirname}/log.log`;
    const errorFile = `${__dirname}/error.log`;
    console.log(`===================== [ ${title} ] ${project.name} =====================`);
    let result = shell.exec(
        command,
        {
            silent: true,
            async:  false,
            cwd,
            stdio:  'pipe',
            env:    {...process.env, GOPATH: gopath},
            uid:    1000,
            shell:  '/bin/bash',
        },
    );
    writeFile(logFile, `===================== [ ${title} ] ${project.name} ===================== \n`);
    if (result.stderr) writeFile(logFile, result.stderr);
    if (result.stdout) {
        writeFile(errorFile, `===================== [ ${title} ] ${project.name} ===================== \n`);
        writeFile(errorFile, result.stdout);
    }
};

async function main(answers) {
    getProjects().then(data => {
        const startTime = Date.now();
        const projects = data.projects.filter(project => !EXCLUDE_PROJECTS[project.name]);
        const count = projects.length;
        let counter = 0;
        const logFile = `${__dirname}/log.log`;
        const errorFile = `${__dirname}/error.log`;
        try {
            fs.unlinkSync(logFile);
        } catch (e) {
        }
        try {
            fs.unlinkSync(errorFile);
        } catch (e) {
        }
        projects.forEach(project => {
            ++counter;
            const dir = `${answers.path}/src/${project.name}` || `go/src/${project.name}`;
            const spendTime = Date.now() - startTime;
            console.info(`\n===================== PROJECT [${counter} of ${count}]: ${project.name}, spend time: ${spendTime}, avg: ${Math.round(
                spendTime / counter)} =====================`);

            if (fs.existsSync(dir) && answers.actions.indexOf('remove project directories') !== -1) {
                executeShellCommand(
                    'REMOVE DIR',
                    `rm -rf ${dir}`,
                    project,
                    __dirname,
                    answers.path,
                );
            }

            executeShellCommand(
                'CLONE PROJECT',
                `git clone ${project.ssh_url_to_repo} ${dir}`,
                project,
                __dirname,
                answers.path,
            );

            if (answers.actions.indexOf('update library') !== -1) {
                executeShellCommand(
                    'UPDATE LIBRARY',
                    `go get -u github.com/golang/dep/cmd/dep && dep ensure -v -update gitlab.alx/msp2.0/msp-lib`,
                    project,
                    dir,
                    answers.path,
                );
            }

            if (answers.actions.indexOf('commit changes') !== -1) {
                executeShellCommand(
                    'COMMIT CHANGES',
                    `git add . && git commit -m "update lib" && git push origin master`,
                    project,
                    dir,
                    answers.path,
                );
            }

            if (answers.actions.indexOf('build projects') !== -1) {
                executeShellCommand(
                    'BUILD PROJECT',
                    `curl -X POST ${JENKINS_URL}${JENKINS_PATH(project.name)} \
                          --user ${JENKINS_USER}:${JENKINS_TOKEN} \
                          --data-urlencode json='{"parameter": [{"name":"notifyTelegram", "value":false}]}'`,
                    project,
                    dir,
                    answers.path,
                );
            }

            if (answers.actions.indexOf('remove directory when finished') !== -1) {
                executeShellCommand(
                    'REMOVE DIR',
                    `rm -rf ${dir}`,
                    project,
                    __dirname,
                    answers.path,
                );
            }
        });
    });
}

inquirer
    .prompt([
        {
            type:      'input',
            name:      'path',
            message:   "Enter the path to directory with projects",
            "default": process.env.GOPATH || `${__dirname}/go`,
            validate:  value => !value ? 'Please enter a path' : true,
        },
        {
            type:    'checkbox',
            message: 'Select actions',
            name:    'actions',
            choices: [
                {
                    name:    'remove project directories',
                    checked: true,
                },
                {
                    name:    'update library',
                    checked: true,
                },
                {
                    name:    'commit changes',
                    checked: true,
                },
                {
                    name:    'build projects',
                    checked: true,
                },
                {
                    name:    'remove directory when finished',
                    checked: true,
                },
            ],
        },
    ])
    .then(answers => {
        main(answers);
    });
process.on('exit', function () {
    console.log('bye');
});

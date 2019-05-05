#!/usr/bin/env bash

NEXUS_YUM_REPOSITORY='https://nexus.msp.mobi/repository/msp-yum/msp'
NEXUS_YUM_CREDENTIALS='mp3deployer:ScjKLQuvqfAXu2bs8ysLAvRt'
NEXUS_MAVEN_REPOSITORY=

function _log(){
    local message="${1:-M:}"
    echo "$message"
}

function _log_error() {
	local error="${1:-ERROR}"
	local error_code="${2:-666}"

    printf "\e[91m%s\e[0m\n" "$error" && exit $error_code
}

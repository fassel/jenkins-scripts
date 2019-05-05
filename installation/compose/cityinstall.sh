#!/usr/bin/env bash

# DIR="$(cd "$(dirname "$0")" && pwd)"
# INSTALL_DIRECTORY=$DIR/installation

INSTALL_DIRECTORY=/opt/citymatica-stage
TEMPORARY_DIRECTORY=$INSTALL_DIRECTORY/temp

DOCKER_COMPOSE_FILE="$INSTALL_DIRECTORY/docker-compose.yml"

DEV_USER='mp3deployer'
DEV_PASS='ScjKLQuvqfAXu2bs8ysLAvRt'

NEXUS_HOST="nexus.msp.mobi"
NEXUS_URL="https://$NEXUS_HOST/repository"
NEXUS_CREDS="$DEV_USER:$DEV_PASS"
NEXUS_RELEASE="msp-maven-releases"
NEXUS_SNAPSHOT="msp-maven-snapshots"
NEXUS_DEVOPS_PATH="$NEXUS_URL/$NEXUS_RELEASE/ru/msp/devops"

TOMCAT_URL="http://127.0.0.1:18080/manager/text"
TOMCAT_CREDS="cityadmin:cbnbflvby"

PG_HOST=''
PG_DATABASE=''
PG_USERNAME=''
PG_PASSWORD=''

DOMAIN_NAME=''

RELEASE_VERSION=''
RELEASE_TYPE=''

# Map to store specific application schema connection
#	key - application name 
#	value - database schema 
declare -A APP_DICTIONARY 
APP_DICTIONARY['aaa']='aaa'
APP_DICTIONARY['sms']='sms'
APP_DICTIONARY['push']='push'
APP_DICTIONARY['email']='email'
APP_DICTIONARY['admin']='webadmin'
APP_DICTIONARY['storage']='storage'
APP_DICTIONARY['script']='script_backend'
APP_DICTIONARY['user-storage']='userstorage'
APP_DICTIONARY['cityservices']='cityservices'
APP_DICTIONARY['booking']='booking'
APP_DICTIONARY['booking_resource']='resource_structure'
APP_DICTIONARY['telegram_transport']='telegram_transport'
APP_DICTIONARY['object-storage']='object_storage'


# ################ #
# Private methods  #
# ################ # 

# Print error message and exit 
# Parameters: 
# 	$1 - error 
# 	$2 - error code
function _log_error() {
	local error="${1:-ERROR}"
	local error_code="${2:-666}"

    printf "\e[91m%s\e[0m\n" "$error" && exit $error_code
}

function _log_header() {
	local message="${1:-INFO}"

	echo "--------------------------------"
  	printf "\e[32m%s\e[0m\n" "$message"
  	echo "--------------------------------"
}

function _validate_permissions() {
    if [ "$(whoami)" != "mp3deployer" ]; then
         _log_error "Script must be run as user: mp3deployer"
	fi
	
	echo "Installation directory: $INSTALL_DIRECTORY"
	mkdir -p $INSTALL_DIRECTORY
	mkdir -p $INSTALL_DIRECTORY/temp
	mkdir -p $INSTALL_DIRECTORY/tomcat/webapps
	
}

function _validate_database_configuration() {
	while [ -z "$PG_HOST" ] || [ -z "$PG_DATABASE" ] || [ -z "$PG_USERNAME" ] || [ -z "$PG_PASSWORD" ]; do 
		echo -e "Input database connection properties: \n" 
		read -p "Host($PG_HOST): " HOST
		read -p "Database($PG_DATABASE): " DATABASE
		read -p "Username($PG_USERNAME): " USERNAME
		read -p "Password($PG_PASSWORD): " PASSWORD

		PG_HOST="${HOST:-$PG_HOST}"
		PG_DATABASE="${DATABASE:-$PG_DATABASE}"
		PG_USERNAME="${USERNAME:-$PG_USERNAME}"
		PG_PASSWORD="${PASSWORD:-$PG_PASSWORD}"
	done

	echo "Used values: "
	echo "  Host: $PG_HOST"
	echo "  Database: $PG_DATABASE"
	echo "  Username: $PG_USERNAME"
	echo "  Password: $PG_PASSWORD"
}

function _validate_domain_configuration() {
	while [ -z "$DOMAIN_NAME" ]; do
		echo -e "Input domain name: \n" 
		read -p "Domain (ex: es.citymatica.com): " DOMAIN_NAME
	done 

	echo "Used values: "
	echo "  Domain: $DOMAIN_NAME"
}

function _validate_release_version() {
	while [ -z "$RELEASE_VERSION" ] ; do
		echo -e "Input release version: \n" 
		read -p "Version (ex: 2018.0.0): " RELEASE_VERSION

		echo -e "Input release type (stable/unstable): \n"
		read -p "Version (default: stable): " RELEASE_TYPE

		RELEASE_TYPE="${RELEASE_TYPE:-stable}"
	done

    if [ "$RELEASE_TYPE" != "unstable" ] ; then
        RELEASE_TYPE="stable"
    fi

	echo "Used values: "
	echo "  Release version: $RELEASE_VERSION"
	echo "  Release type: $RELEASE_TYPE"
}


# Parameters
#	$1 - application name
# 	$2 - application archive 
#	$3 - application download uri 
function _redeploy_ui_app() {
	local APPLICATION="${1:-}"
	local APPLICATION_ARCHIVE="${2:-}"
	local APPLICATION_DOWNLOAD_URI="${3:-}"

	local APP_DIR=$INSTALL_DIRECTORY/web
	local TMP_ARCHIVE=$TEMPORARY_DIRECTORY/$APPLICATION_ARCHIVE

	echo "Download artifact: $APPLICATION_DOWNLOAD_URI"
    local HTTP_CODE=$(curl -f --write-out '%{http_code}\n' -o "$TMP_ARCHIVE" "$APPLICATION_DOWNLOAD_URI" | tail -1)
    if [ "$HTTP_CODE" != "200" ]; then
		_log_error "Redeploy $APPLICATION FAILED"
    fi

	echo "Deploy artifact: $APPLICATION"
    rm -Rf "$APP_DIR/$APPLICATION*" && tar -xzvmf $TMP_ARCHIVE -C $APP_DIR
}

# Parameters
#	$1 - application name
# 	$2 - application archive 
#	$3 - application download uri 
function _redeploy_war_app() {
	local APPLICATION="${1:-}"
	local APPLICATION_ARCHIVE="${2:-}"
	local APPLICATION_DOWNLOAD_URI="${3:-}"

	local APP_DIR=$INSTALL_DIRECTORY/tomcat/webapps
	local TMP_ARCHIVE=$TEMPORARY_DIRECTORY/$APPLICATION_ARCHIVE

    echo "Download artifact: $APPLICATION_DOWNLOAD_URI"
    local HTTP_CODE=$(curl -f --write-out '%{http_code}\n' -o "$TMP_ARCHIVE" "$APPLICATION_DOWNLOAD_URI" | tail -1)
    if [ "$HTTP_CODE" != "200" ]; then
		_log_error "Redeploy $APPLICATION FAILED"
    fi

    local APP_CONTEXT=$(_war_tomcat_path $APPLICATION_ARCHIVE)
    echo "Undeploy artifact: ${APPLICATION_ARCHIVE%.war} $APP_CONTEXT"
    curl -u ${TOMCAT_CREDS} "$TOMCAT_URL/stop?path=/$APP_CONTEXT" || true
    curl -u ${TOMCAT_CREDS} "$TOMCAT_URL/undeploy?path=/$APP_CONTEXT" || true

    echo "Deploy artifact: $APPLICATION"
    mv -f "$TMP_ARCHIVE" "$APP_DIR"
}

# get path from archive name
function _war_tomcat_path() {
	local VAR="${1%.war}"
	echo "${VAR/\#/\/}"
}


# ############### #
# Public methods  #
# ############### # 

# Download and extract ( or update) compose distribution
# Parameters:
# 	$1 - Compose version (optional)
function fn_docker_init() {
	_log_header "Docker compose configuration: BEGIN"
	
	local COMPOSE_VERSION="$1"
	if [ -z "$COMPOSE_VERSION" ]; then
		echo "Docker version not specified. Please input:"
		read -p '  COMPOSE_VERSION (default 1.0): ' COMPOSE_VERSION
	fi

	COMPOSE_VERSION="${COMPOSE_VERSION:-1.0}"
	echo "Choosed compose version: $COMPOSE_VERSION"
	
	local COMPOSE_ARCHIVE="$INSTALL_DIRECTORY/compose.tar.gz"
	local COMPOSE_DOWNLOAD_URI="$NEXUS_DEVOPS_PATH/compose/$COMPOSE_VERSION/compose-$COMPOSE_VERSION.tar.gz"
 	
 	echo "  Download and extract:"
 	local HTTP_CODE=$(curl -v  -u $DEV_USER:$DEV_PASS -f --write-out '%{http_code}\n' -o "$COMPOSE_ARCHIVE" "$COMPOSE_DOWNLOAD_URI" | tail -1)
    if [ "$HTTP_CODE" != "200" ]; then
		_log_error "Docker compose configuration: Download FAILED."
    fi

  	( cd $INSTALL_DIRECTORY && tar -xzmf "$COMPOSE_ARCHIVE" )

	echo "  Files:"
	ls -d -1 $INSTALL_DIRECTORY/**/*

	echo "Docker compose configuration: DONE"
}

# Docker registry login
function fn_docker_login() {
	_log_header "Docker login: BEGIN"

	#echo "  Docker login (tl-docker-snapshots.nx.alx):"
	#docker login tl-docker-snapshots.nx.alx -u $DEV_USER -p $DEV_PASS

	echo "  Docker login ($NEXUS_HOST):"
    docker login $NEXUS_HOST -u $DEV_USER -p $DEV_PASS

	if [ $? -ne 0 ]; then
		#_log_error "Docker login(tl-docker-snapshots.nx.alx): FAILED"
		_log_error "Docker login($NEXUS_HOST): FAILED"
    fi

	#echo "  Docker login (tl-docker-releases.nx.alx):"
	#docker login tl-docker-releases.nx.alx -u $DEV_USER -p $DEV_PASS
	#if [ $? -ne 0 ]; then
    #	_log_error "Docker login(tl-docker-snapshots.nx.alx): FAILED"
	#fi

	echo "Docker login: DONE"
}

# Docker registry pull images
function fn_docker_pull() {
	_log_header "Docker pull images: BEGIN"
	
	echo "  Pull $DOCKER_COMPOSE_FILE:"
	docker-compose -f $DOCKER_COMPOSE_FILE pull
	if [ $? -ne 0 ]; then
    	_log_error "Docker pull images: FAILED"
	fi

	echo "Docker pull images: DONE"
}

# Restart full compose environment or specific container
# Parameters: 
# 	$1 (optional) - docker container
function fn_docker_restart() {
	_log_header "Docker restart: BEGIN"

	local CONTAINER="${1:-}"
	docker-compose -f $DOCKER_COMPOSE_FILE restart $CONTAINER
	if [ $? -ne 0 ]; then
    	_log_error "Docker restart: FAILED"
	fi

	echo "Docker restart: DONE"
}

function fn_database_config_update() {
	_log_header "Update database configuration: BEGIN"
	
	_validate_database_configuration

	sed -i "s/PG_HOST/$PG_HOST/g"		  $INSTALL_DIRECTORY/tomcat/server.xml
	sed -i "s/PG_DATABASE/$PG_DATABASE/g" $INSTALL_DIRECTORY/tomcat/server.xml
	sed -i "s/PG_USERNAME/$PG_USERNAME/g" $INSTALL_DIRECTORY/tomcat/server.xml
	sed -i "s/PG_PASSWORD/$PG_PASSWORD/g" $INSTALL_DIRECTORY/tomcat/server.xml

	echo "Update database configuration: DONE"
}

function fn_database_dump_restore() {
	_log_header "Postgresql dump restore: BEGIN"
	
	read -p "Want to restore postgresql dump?(Y/N): " ANSWER
	if [ "${ANSWER:-N}" == "Y" ]; then
		_validate_database_configuration

		local PSQL="psql -q -h $PG_HOST -d $PG_DATABASE -U $PG_USERNAME -f /tmp/cleandump.sql"
		docker run --rm -v $INSTALL_DIRECTORY/postgres:/tmp postgres:9.6.8-alpine sh -c "PGPASSWORD=$PG_PASSWORD $PSQL"
	fi

	echo "Postgresql dump restore: DONE"
}

function fn_java_app_config_update() {
	_log_header "Update java app configuration: BEGIN"
	
	_validate_database_configuration

	local APP_CONFIG_TEMPLATE=$INSTALL_DIRECTORY/tomcat/conf/application.yml

	for APP in "${!APP_DICTIONARY[@]}"; do 
		printf "Create configuration [%s]\n" "${APP}" 

		local APP_SCHEMA=${APP_DICTIONARY[$APP]}
		local APP_CONFIG=${INSTALL_DIRECTORY}/tomcat/conf/${APP}.yml
		
		cp -f $APP_CONFIG_TEMPLATE $APP_CONFIG

		sed -i "s/PG_HOST/$PG_HOST/g" 		  $APP_CONFIG
		sed -i "s/PG_DATABASE/$PG_DATABASE/g" $APP_CONFIG
		sed -i "s/PG_USERNAME/$PG_USERNAME/g" $APP_CONFIG
		sed -i "s/PG_PASSWORD/$PG_PASSWORD/g" $APP_CONFIG
		sed -i "s/PG_SCHEMA/$APP_SCHEMA/g"	  $APP_CONFIG
	done

	echo "Update java app configuration: DONE"
}

function fn_ui_app_config_update() {
	_log_header "Update ui app configuration: BEGIN"

	_validate_domain_configuration

	sed -i "s/DOMAIN/$DOMAIN_NAME/g" $INSTALL_DIRECTORY/web/conf/frontend-ui.js
	sed -i "s/DOMAIN/$DOMAIN_NAME/g" $INSTALL_DIRECTORY/web/conf/operator-ui.js
	sed -i "s/DOMAIN/$DOMAIN_NAME/g" $INSTALL_DIRECTORY/web/conf/confirmation.html

	echo "Update ui app configuration: DONE"
}



# Retrive and install application by release version
# 2018.0.0
# Parameters:
# 	$1 - version

function fn_release_update() {
	_log_header "Release update: BEGIN"

	_validate_release_version

	# currently installed release file
	local CURRENT_FILE="$INSTALL_DIRECTORY/release.txt"
	
	# new (update) release file
	local RELEASE_FILE="$INSTALL_DIRECTORY/release-$RELEASE_VERSION-$RELEASE_TYPE.txt"
	local RELEASE_DOWNLOAD_URI="$NEXUS_DEVOPS_PATH/release/$RELEASE_VERSION-$RELEASE_TYPE/release-$RELEASE_VERSION-$RELEASE_TYPE.txt"

	echo "  Download release:"
 	local HTTP_CODE=$(curl -v -f --write-out '%{http_code}\n' -o "$RELEASE_FILE" "$RELEASE_DOWNLOAD_URI" | tail -1)
    if [ "$HTTP_CODE" != "200" ]; then
    	_log_error "Release download: FAILED"
    fi

	while read LINE || [ -n "$LINE" ]; do
        DATA_ARRAY=(${LINE//,/ })

        local CURRENT_ARTIFACT="unknown"
        if [[ -f "$CURRENT_FILE" ]]; then
            CURRENT_ARTIFACT=`awk -F',' '/^'${DATA_ARRAY[0]}',/ {print $4}' "$CURRENT_FILE"`
        fi

        if [[ "${DATA_ARRAY[3]}" == "${CURRENT_ARTIFACT}" ]]; then
            echo "Previous version equals current. Skip ${DATA_ARRAY[0]}"
        else
            echo "Redeploy module ${DATA[0]}"
            if [[ ${DATA_ARRAY[0]} == *ui ]]; then
                _redeploy_ui_app ${DATA_ARRAY[0]} ${DATA_ARRAY[1]} ${DATA_ARRAY[3]}
            else
                _redeploy_war_app ${DATA_ARRAY[0]} ${DATA_ARRAY[1]} ${DATA_ARRAY[3]}
            fi
        fi
	done < $RELEASE_FILE

	# replace cuurent release file
	mv $RELEASE_FILE $CURRENT_FILE
}

function fn_install() {
	_log_header "Hi)"

	read -p "Want to create initial installation?(Y/N): " ANSWER
		
	if [ "${ANSWER:-N}" == "Y" ]; then
		_log_header "Ok. Let's go)"

		fn_docker_login
		fn_docker_init
		fn_docker_pull

		fn_database_dump_restore
		fn_database_config_update
		fn_java_app_config_update
		fn_ui_app_config_update

		fn_release_update
	fi

	_log_header "Thank you and goodbye)"
}

#
#
# Run program
# 
# Parameters:
# 	$1 - function to execute
#
# Examples:
# sh not works
# bash -c "$(curl -fsSL https://nexus.alx/repository/msp-maven-releases/ru/msp/devops/install/1.0/install-1.0.sh)"
# bash -c "$(wget https://nexus.alx/repository/msp-maven-releases/ru/msp/devops/compose/1.0/install-1.0.sh -O -)"
#
function main() {
	local func="${1:-}"
	
	_validate_permissions

	case "$func" in
		"fn_docker_init")
			fn_docker_init
			;;
		"fn_docker_login") 
			fn_docker_login
			;;
		"fn_docker_pull")
			fn_docker_pull
			;;
		"fn_docker_restart")
			fn_docker_restart
			;;		
		"fn_database_config_update")
			fn_database_config_update
			;;
		"fn_database_dump_restore")
			fn_database_dump_restore
			;;
		"fn_java_app_config_update")
			fn_java_app_config_update
			;;
		"fn_ui_app_config_update")
			fn_ui_app_config_update
			;;
		"fn_release_update")
			fn_release_update
			;;
		"fn_install")
			fn_install
			;;	
		"help")
			_log_error "Hahaha) Help page not found"
			;;
		*)
			fn_install
			;;
	esac
}

main $@


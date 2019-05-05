#!/usr/bin/env bash

DIR="$(cd "$(dirname "$0")" && pwd)"

######################################################

NEXUS_URL="https://nexus.msp.mobi/repository/msp-maven-releases/ru/msp/devops/compose"
NEXUS_CREDS="mp3deployer:ScjKLQuvqfAXu2bs8ysLAvRt"

COMPOSE_DATA=$DIR/compose
COMPOSE_ARCHIVE=$DIR/compose.tar.gz
( cd $COMPOSE_DATA && tar -zcvf $COMPOSE_ARCHIVE * )

COMPOSE_VERSION="${1:-1.0}"
COMPOSE_UPLOAD_URL="$NEXUS_URL/$COMPOSE_VERSION/compose-$COMPOSE_VERSION.tar.gz"

curl -v -k -u "$NEXUS_CREDS" --upload-file "$COMPOSE_ARCHIVE" "$COMPOSE_UPLOAD_URL" && rm -f $COMPOSE_ARCHIVE

######################################################

NEXUS_URL="https://nexus.msp.mobi/repository/msp-maven-releases/ru/msp/devops/install"
NEXUS_CREDS="mp3deployer:ScjKLQuvqfAXu2bs8ysLAvRt"

INSTALL_FILE=$DIR/compose/cityinstall.sh
INSTALL_VERSION="${1:-1.0}"
INSTALL_UPLOAD_URL="$NEXUS_URL/$INSTALL_VERSION/install-$INSTALL_VERSION.sh"

curl -v -k -u "$NEXUS_CREDS" --upload-file "$INSTALL_FILE" "$INSTALL_UPLOAD_URL"
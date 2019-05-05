#!/usr/bin/env bash

PROJECT=$1
VERSION=$2
URL=$3

cd "$(dirname "$0")" && pwd && source env.sh
rm -Rf BUILD BUILDROOT RPMS

_log "Lets begin!!!"
if [ -z "$PROJECT" ] || [ -z "$VERSION" ] || [ -z "$URL" ]; then
    _log_error "Bad input parameters" 2
fi

_log "Download archive $URL"
cd SOURCES && curl --silent --show-error --fail -O "${URL}" || exit
cd -

_log "Build rmp archive"
rpmbuild -bb \
    --define "_topdir `pwd`" \
    --define "__app_name ${PROJECT}" \
    --define "__app_version ${VERSION}" \
    SPECS/app.spec || exit

_log "Publish archive"

ARCHIVE_PATH=$(find ./RPMS -name "${PROJECT}*.rpm")
ARCHIVE_NAME=$(basename "${ARCHIVE_PATH}")
if [ -z "$ARCHIVE_PATH" ] || [ -z "$ARCHIVE_NAME" ]; then
    _log_error "Build rpm not found" 2
fi

_log "ARCH: ${ARCHIVE_NAME} ${ARCHIVE_PATH}"

curl -v --fail --user "${NEXUS_YUM_CREDENTIALS}" \
    --upload-file "${ARCHIVE_PATH}" \
    "${NEXUS_YUM_REPOSITORY}/${ARCHIVE_NAME}" || exit


_log "Done!!!"
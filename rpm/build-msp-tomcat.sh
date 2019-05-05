#!/usr/bin/env bash

cd "$(dirname "$0")" && pwd && source env.sh
rm -Rf BUILD BUILDROOT RPMS
cd ../
./gradlew tgzTomcatDependencies
cd rpm

_log "Build rmp archive"
rpmbuild -bb --define "_topdir `pwd`" ./SPECS/msp-tomcat.spec || exit
_log "Build rmp archive FINISH"

_log "Publish rmp archive"

ARCHIVE_PATH=$(find ./RPMS -name "msp-tomcat*.rpm")
ARCHIVE_NAME=$(basename "${ARCHIVE_PATH}")
if [ -z "$ARCHIVE_PATH" ] || [ -z "$ARCHIVE_NAME" ]; then
    _log_error "Build rpm not found" 2
fi

_log "ARCH: ${ARCHIVE_NAME} ${ARCHIVE_PATH}"

curl -v --fail --user "${NEXUS_YUM_CREDENTIALS}" \
    --upload-file "${ARCHIVE_PATH}" \
    "${NEXUS_YUM_REPOSITORY}/${ARCHIVE_NAME}" || exit


_log "Done!!!"

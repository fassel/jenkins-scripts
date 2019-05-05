#!/usr/bin/env bash

export JAVA_OPTS="$JAVA_OPTS -Djava.security.egd=file:/dev/urandom"
export CATALINA_OPTS="$CATALINA_OPTS -Xms500m -Xmx2000m"
export CATALINA_OPTS="$CATALINA_OPTS -Dspring.jmx.enabled=false"
export CATALINA_OPTS="$CATALINA_OPTS -Dsecurity.basic.enabled=false"
export CATALINA_OPTS="$CATALINA_OPTS -Dspring.profiles.active=default,local"
export CATALINA_OPTS="$CATALINA_OPTS -Dhazelcast.health.monitoring.level=OFF"
export CATALINA_OPTS="$CATALINA_OPTS -agentlib:jdwp=transport=dt_socket,address=18000,server=y,suspend=n"
export CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote.port=19000"
export CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote.authenticate=false"
export CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote.ssl=false"
export CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote.rmi.port=19000"
export CATALINA_OPTS="$CATALINA_OPTS -Djava.rmi.server.hostname=0.0.0.0"

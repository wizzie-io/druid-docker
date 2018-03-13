#!/usr/bin/env bash
/usr/bin/druid-pull-deps.sh

envsubst < /opt/druid/conf/_common/common.runtime.properties_env > /opt/druid/conf/_common/common.runtime.properties
envsubst < /opt/druid/conf/_common/log4j2.xml_env > /opt/druid/conf/_common/log4j2.xml
envsubst < /opt/druid/conf/_common/jets3t.properties_env > /opt/druid/conf/_common/jets3t.properties
envsubst < /opt/druid/conf/${DRUID_SERVICE}/runtime.properties_env > /opt/druid/conf/${DRUID_SERVICE}/runtime.properties
java ${DRUID_JVM_ARGS} -cp /opt/druid/conf/_common:/opt/druid/conf/${DRUID_SERVICE}:/opt/druid/lib/* io.druid.cli.Main server ${DRUID_SERVICE}

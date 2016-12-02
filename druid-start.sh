#!/usr/bin/env bash
envsubst < ${DRUID_HOME}/conf/_common/common.runtime.properties_env > ${DRUID_HOME}/conf/_common/common.runtime.properties
envsubst < ${DRUID_HOME}/conf/_common/log4j2.xml_env > ${DRUID_HOME}/conf/_common/log4j2.xml
envsubst < ${DRUID_HOME}/conf/${DRUID_SERVICE}/runtime.properties_env > ${DRUID_HOME}/conf/${DRUID_SERVICE}/runtime.properties

rm -f ${DRUID_HOME}/conf/_common/common.runtime.properties_env ${DRUID_HOME}/conf/_common/log4j2.xml_env ${DRUID_HOME}/conf/${DRUID_SERVICE}/runtime.properties_env

java ${DRUID_JVM_ARGS} -cp ${DRUID_HOME}/conf/_common:${DRUID_HOME}/conf/${DRUID_SERVICE}:${DRUID_HOME}/lib/* io.druid.cli.Main server ${DRUID_SERVICE}

#!/usr/bin/env bash
pushd /opt/druid
if [[ ! -z "${DRUID_PULL_EXTENSION}" ]]; then
  java -cp "lib/*" -Ddruid.extensions.directory="extensions" -Ddruid.extensions.hadoopDependenciesDir="hadoop-dependencies" io.druid.cli.Main tools pull-deps --no-default-hadoop `for n in $(echo ${DRUID_PULL_EXTENSION} ); do echo -n "-c $n "; done`
fi
popd

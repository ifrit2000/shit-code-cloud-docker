#!/usr/bin/env sh
set -e

if [ ! ${CONSUL_CONFIG_DIR} ]; then
  CONSUL_CONFIG_DIR_PARAM=/consul/config
else
  CONSUL_CONFIG_DIR_PARAM=$CONSUL_CONFIG_DIR
fi

echo ${CONSUL_CONFIG_DIR_PARAM}

if [ "$(ls -A ${CONSUL_CONFIG_DIR_PARAM})" = "" ]; then
  consul agent -dev
else
  consul agent -config-dir=${CONSUL_CONFIG_DIR_PARAM}
fi

#consul
java -jar ${APP}.jar

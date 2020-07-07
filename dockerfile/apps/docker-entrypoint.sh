#!/usr/bin/env sh
set -e

if [ ! ${CONSUL_CONFIG_DIR} ]; then
  CONSUL_CONFIG_DIR_PARAM=/consul/config
else
  CONSUL_CONFIG_DIR_PARAM=$CONSUL_CONFIG_DIR
fi

if [ "$(ls -A ${CONSUL_CONFIG_DIR_PARAM})" = "" ]; then
  echo 'consul配置目录为空, dev模式启动'
  consul agent -dev
else
  echo "consul配置目录: ${CONSUL_CONFIG_DIR_PARAM}"
  consul agent -config-dir=${CONSUL_CONFIG_DIR_PARAM}
fi

#consul
java -jar ${APP}.jar

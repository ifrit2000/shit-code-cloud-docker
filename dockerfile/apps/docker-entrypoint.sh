#!/usr/bin/env sh
set -e

consul agent -config-dir=/consul/config
#consul
java -jar ${APP}.jar
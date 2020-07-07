#!/usr/bin/env sh
set -e

consul agent -config-dir=/consul/config -data-dir=/consul/data
#consul
java -jar ${APP}.jar
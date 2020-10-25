#!/bin/bash

cd $1
cd ../compose-file
docker-compose \
-f 00_network.yml \
-f 01_haproxy.yml \
-f 02_consul.yml \
-f 03_mysql.yml \
-f 04_redis.yml \
-f 05_rabbitMq.yml \
-f 06_zipkin.yml \
-f 07_elk.yml \
-f 08_prometheus.yml \
up -d

docker-compose \
-f 00_network.yml \
-f 10_admin.yml \
-f 11_gateway.yml \
up -d
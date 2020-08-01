#!/bin/bash
cd ../compose-file
docker-compose \
-f 01_network.yml \
-f 02_consul.yml \
-f 03_mysql.yml \
-f 04_redis.yml \
-f 05_rabbitMq.yml \
-f 06_zipkin.yml \
-f 07_elk.yml \
up
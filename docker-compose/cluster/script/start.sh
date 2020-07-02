#!/usr/bin/env bash
docker-compose -f compose/01_network.yml -f compose/02_consul.yml -f compose/03_mysql.yml -f compose/04_redis.yml -f compose/05_rabbitMq.yml up
#docker-compose -f compose/01_network.yml -f compose/04_redis.yml up
#docker-compose -f compose/01_network.yml -f compose/03_mysql.yml up
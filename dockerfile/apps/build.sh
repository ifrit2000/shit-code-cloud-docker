#!/bin/bash
#echo ${app_name[0]}
#docker build  --no-cache --build-arg GIT_BRANCH=dev --build-arg APP_NAME=infrastructure-${NAME} \
#  --build-arg GIT_REPO=shit-code-cloud-infrastructure -f app.Dockerfile -t cd871127/infrastructure-${NAME}:dev .

# 构建基础jar镜像
GIT_POSTFIX=infrastructure
GIT_BRANCH=dev
APP_NAME=gateway
JAR_NAME=${GIT_POSTFIX}-${APP_NAME}

docker build --build-arg GIT_BRANCH=${GIT_BRANCH} --build-arg GIT_POSTFIX=${GIT_POSTFIX} -f base.Dockerfile -t app-base:tmp .

docker build --build-arg APP_NAME=${APP_NAME} --build-arg GIT_POSTFIX=${GIT_POSTFIX} -f app.Dockerfile -t cd871127/${APP_NAME}:dev .

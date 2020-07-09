#!/bin/bash
app_name=("1" "2")
#echo ${app_name[0]}
#docker build  --no-cache --build-arg GIT_BRANCH=dev --build-arg APP_NAME=infrastructure-${NAME} \
#  --build-arg GIT_REPO=shit-code-cloud-infrastructure -f app.Dockerfile -t cd871127/infrastructure-${NAME}:dev .

# 构建基础jar镜像
GIT_POSTFIX=infrastructure
GIT_BRANCH=dev

docker build --build-arg GIT_BRANCH=${GIT_BRANCH} --build-arg GIT_POSTFIX=${GIT_POSTFIX} -f base.Dockerfile -t app-base:tmp .



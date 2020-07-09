#!/bin/bash
# 构建基础jar镜像
GIT_POSTFIX=infrastructure
GIT_BRANCH=dev
APP_NAMES=(gateway admin)
TMP_IMAGE=app-base:tmp

if [ ! $1 ]; then
  docker build --no-cache --build-arg GIT_BRANCH=${GIT_BRANCH} --build-arg GIT_POSTFIX=${GIT_POSTFIX} -f base.Dockerfile -t ${TMP_IMAGE} .
else
  docker build --build-arg GIT_BRANCH=${GIT_BRANCH} --build-arg GIT_POSTFIX=${GIT_POSTFIX} -f base.Dockerfile -t ${TMP_IMAGE} .
fi


for APP_NAME in ${APP_NAMES[*]}; do
  JAR_NAME=${GIT_POSTFIX}-${APP_NAME}
  docker build --no-cache --build-arg APP_NAME=${APP_NAME} --build-arg GIT_POSTFIX=${GIT_POSTFIX} -f app.Dockerfile -t cd871127/${JAR_NAME}:dev .
done
#docker rmi ${TMP_IMAGE}

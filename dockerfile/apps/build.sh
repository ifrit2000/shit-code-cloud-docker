#!/bin/bash
app_name=("1" "2")
#echo ${app_name[0]}
#docker build  --no-cache --build-arg GIT_BRANCH=dev --build-arg APP_NAME=infrastructure-${NAME} \
#  --build-arg GIT_REPO=shit-code-cloud-infrastructure -f app.Dockerfile -t cd871127/infrastructure-${NAME}:dev .
for var in ${app_name[*]}; do
  echo "${var}"
done

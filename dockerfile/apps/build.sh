#!/bin/bash
docker build  --no-cache --build-arg GIT_BRANCH=dev --build-arg APP_NAME=infrastructure-admin \
  --build-arg GIT_REPO=shit-code-cloud-infrastructure -f app.Dockerfile -t cd871127/infrastructure-admin:dev .
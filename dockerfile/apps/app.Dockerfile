ARG GRADLE_VERSION=6.5.1
ARG GIT_REPO=shit-code-cloud-infrastructure
ARG APP_NAME=infrastructure-admin

FROM openjdk:11
MAINTAINER Anthony


RUN mkdir -p /tmp/build &&\
    cd /tmp/build &&\
    wget -q https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip &&\
    unzip -q gradle-${GRADLE_VERSION}-bin.zip &&\
    git clone https://github.com/cd871127/${GIT_REPO}.git &&\
    cd ${GIT_REPO} &&\
    /tmp/build/gradle-${GRADLE_VERSION}/bin/gradle ${APP_NAME}:bootJar


FROM cd871127/container:java11.consul1.8.0

RUN mkdir -p /app/config &&\
    mkdir -p /app/data &&\
WORKDIR /app
COPY --from=0 /tmp/build/${GIT_REPO}/${APP_NAME}/build/libs/${APP_NAME}.jar .



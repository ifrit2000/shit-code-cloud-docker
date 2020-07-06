FROM cd871127/container:java11.consul1.8.0
MAINTAINER Anthony

ARG GRADLE_VERSION=6.5.1
ARG GRADLE_RELEASE=https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip
ARG GIT_REPO=shit-code-cloud-infrastructure
ARG APP_NAME=infrastructure-admin

RUN mkdir -p /app/config &&\
    mkdir -p /tmp/build &&\
    cd /tmp/build &&\
    git clone https://github.com/cd871127/${GIT_REPO}.git &&\
    wget ${GRADLE_RELEASE} &&\
    unzip gradle-$GRADLE_VERSION-bin.zip
    cd ${GIT_REPO} &&\
    /tmp/build/gradle-${GRADLE_VERSION}/bin/gradle ${APP_NAME}:bootJar &&\
    cp ${APP_NAME}/build/libs/${APP_NAME}.jar /app
    rm -rf /tmp/build/ &&\
    rm -rf ~/.gradle &&\

VOLUME /app/config

EXPOSE 8080

ENTRYPOINT ["java","-jar","${APP_NAME}.jar"]


FROM cd871127/container:java11.consul1.8.0
MAINTAINER Anthony

ARG GRADLE_VERSION
ARG GRADLE_RELEASE
ARG GIT_REPO
ARG APP_NAME

ONBUILD RUN mkdir -p /app/config &&\
    mkdir -p /app/data &&\
    mkdir -p /tmp/build &&\
    cd /tmp/build &&\
    git clone https://github.com/cd871127/${GIT_REPO}.git &&\
    wget -q ${GRADLE_RELEASE} &&\
    unzip -q gradle-$GRADLE_VERSION-bin.zip &&\
    cd ${GIT_REPO} &&\
    /tmp/build/gradle-${GRADLE_VERSION}/bin/gradle ${APP_NAME}:bootJar &&\
    cp ${APP_NAME}/build/libs/${APP_NAME}.jar /app  &&\
    rm -rf /tmp/build/ &&\
    rm -rf ~/.gradle

VOLUME /app/config

EXPOSE 8080

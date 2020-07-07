ARG GIT_REPO=shit-code-cloud-infrastructure
ARG APP_NAME=infrastructure-gateway
ARG GIT_BRANCH=master
FROM gradle:6.5.1-jdk11
MAINTAINER Anthony
ARG GIT_REPO
ARG APP_NAME
ARG GIT_BRANCH
RUN mkdir -p /tmp/build &&\
    cd /tmp/build &&\
    git clone https://github.com/cd871127/${GIT_REPO}.git &&\
    cd ${GIT_REPO} &&\
    git checkout -b ${GIT_BRANCH} origin/${GIT_BRANCH}  &&\
    gradle bootJar

FROM cd871127/container:0.0.2
ARG GIT_REPO
ARG APP_NAME

ENV APP=${APP_NAME}
RUN mkdir -p /app/config &&\
    mkdir -p /app/log

COPY docker-entrypoint.sh /bin

WORKDIR /app
COPY --from=0 /tmp/build/${GIT_REPO}/${APP_NAME}/build/libs/${APP_NAME}.jar .
COPY docker-entrypoint.sh /bin

VOLUME /app/config
VOLUME /app/log

EXPOSE 8080

ENTRYPOINT ["docker-entrypoint.sh"]

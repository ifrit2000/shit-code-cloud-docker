FROM gradle:6.6.0-jdk11
MAINTAINER Anthony
ARG GIT_POSTFIX
ARG GIT_BRANCH
RUN mkdir -p /tmp/build &&\
    cd /tmp/build &&\
    git clone https://github.com/cd871127/shit-code-cloud-${GIT_POSTFIX}.git &&\
    cd shit-code-cloud-${GIT_POSTFIX} &&\
    git checkout -b ${GIT_BRANCH} origin/${GIT_BRANCH}  &&\
    gradle bootJar
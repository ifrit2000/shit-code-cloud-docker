FROM cd871127/app-base:0.1.0
MAINTAINER Anthony

ARG GRADLE_VERSION=6.5.1
ARG GRADLE_RELEASE=https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip
ARG GIT_REPO=shit-code-cloud-infrastructure
ARG APP_NAME=infrastructure-admin

ENTRYPOINT ["java","-jar","infrastructure-admin.jar"]
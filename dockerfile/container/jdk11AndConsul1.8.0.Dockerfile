FROM openjdk:11
MAINTAINER Anthony

ENV CONSUL_VERSION=1.8.0

ENV HASHICORP_RELEASES=https://releases.hashicorp.com

RUN set -eux && \
    mkdir -p /tmp/build && \
    cd /tmp/build && \
    apkArch="$(uname -m)" && \
    case "${apkArch}" in \
        aarch64) consulArch='arm64' ;; \
        armhf) consulArch='armhfv6' ;; \
        x86) consulArch='386' ;; \
        x86_64) consulArch='amd64' ;; \
        *) echo >&2 "error: unsupported architecture: ${apkArch} (see ${HASHICORP_RELEASES}/consul/${CONSUL_VERSION}/)" && exit 1 ;; \
    esac && \
    wget ${HASHICORP_RELEASES}/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_${consulArch}.zip && \
    unzip -d /bin consul_${CONSUL_VERSION}_linux_${consulArch}.zip && \
    cd /tmp && \
    rm -rf /tmp/build && \
    echo $'[Unit] \n\
    Description=Consul is a tool for service discovery and configuration. Consul is distributed, highly available, and extremely scalable. \n\
    Documentation=http://www.consul.io \n\
    After=network-online.target \n\
    Wants=network-online.target \n\
    [Service] \n\
    LimitCORE=infinity \n\
    LimitNOFILE=100000 \n\
    LimitNPROC=100000 \n\
    EnvironmentFile=-/etc/sysconfig/consul \n\
    ExecStart=consul agent -config-dir=/consul/config \n\
    ExecReload=/bin/kill -HUP \$MAINPID \n\
    KillSignal=SIGINT \n\
    [Install] \n\
    WantedBy=multi-user.target' > /lib/systemd/system/consul.service && \
    systemctl enable consul && \
    consul version

RUN mkdir -p /consul/data && \
    mkdir -p /consul/config

VOLUME /consul/data

EXPOSE 8300

EXPOSE 8301 8301/udp 8302 8302/udp

EXPOSE 8500 8600 8600/udp



#systemctl enable consul
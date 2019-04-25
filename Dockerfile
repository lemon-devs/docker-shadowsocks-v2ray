FROM centos:7
LABEL maintainer "YumeMichi <do4suki@gmail.com>"

# Main
RUN rm -rf /etc/yum.repos.d/* \
    && curl http://mirrors.aliyun.com/repo/Centos-7.repo > /etc/yum.repos.d/CentOS-Base.repo \
    && curl http://mirrors.aliyun.com/repo/epel-7.repo > /etc/yum.repos.d/epel.repo \
    && curl https://copr.fedorainfracloud.org/coprs/librehat/shadowsocks/repo/epel-7/librehat-shadowsocks-epel-7.repo > /etc/yum.repos.d/librehat-shadowsocks-epel-7.repo \
    && yum makecache \
    && yum install -y shadowsocks-libev wget \
    && mkdir ~/sstmp && cd ~/sstmp \
    && wget -O v2ray-plugin-linux-amd64-v1.1.0.tar.gz https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.1.0/v2ray-plugin-linux-amd64-v1.1.0.tar.gz \
    && tar xf v2ray-plugin-linux-amd64-v1.1.0.tar.gz && mv v2ray-plugin_linux_amd64 /usr/bin/v2ray-plugin \
    && rm -rf ~/sstmp \
    && yum clean all

# Port
EXPOSE 80

# Entrypoint
COPY docker-entrypoint.sh /
ENTRYPOINT [ "/docker-entrypoint.sh" ]


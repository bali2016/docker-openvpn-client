# Smallest base image
FROM alpine:3.4

MAINTAINER Bali Bao <bali.baolei@cn.ibm.com>

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories && \
    echo "http://dl-4.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk add --update openvpn bash tcpdump pamtester && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

# Needed by scripts
ENV OPENVPN /etc/openvpn

VOLUME ["/etc/openvpn"]

CMD ["ovpn_client_run"]

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

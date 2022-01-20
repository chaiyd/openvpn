FROM alpine:3.15

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata \
    && apk add dumb-init bash openvpn easy-rsa openvpn-auth-ldap openssl openssl-dev \
    && rm -rf /var/cache/apk/*

RUN ln -s /usr/share/easy-rsa/easyrsa /usr/bin/easyrsa
ADD conf /etc/openvpn/conf
ADD start.sh /etc/openvpn

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/bin/sh","/etc/openvpn/start.sh"]

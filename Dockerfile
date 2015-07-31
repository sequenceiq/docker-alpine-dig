FROM alpine:3.2

RUN apk add -U alpine-sdk linux-headers \
    && curl ftp://ftp.isc.org/isc/bind9/9.10.2/bind-9.10.2.tar.gz|tar -xzv \
    && cd bind-9.10.2 \
    && CFLAGS="-static" ./configure --without-openssl --disable-symtable \
    && make \
    && cp ./bin/dig/dig /usr/bin/ \
    && apk del alpine-sdk linux-headers \
    && rm -rf bind-9.10.2 \
    && rm /var/cache/apk/*

CMD bash

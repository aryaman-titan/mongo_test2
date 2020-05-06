FROM alpine:edge

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories
RUN apk update
RUN apk add --no-cache mongodb
RUN apk add --no-cache su-exec

ENV MONGO_INITDB_ROOT_USERNAME "alphadose"
ENV MONGO_INITDB_ROOT_PASSWORD "alphadose"

VOLUME /data/db

COPY run.sh /root
ENTRYPOINT [ /root/run.sh ]
CMD [ mongod, --bind_ip, 0.0.0.0 ]
 
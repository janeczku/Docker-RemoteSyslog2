FROM alpine:3.4
MAINTAINER Jan Broer <janeczku@yahoo.com>

RUN apk add --update -t build-dependencies wget ca-certificates \
  && wget -q -O - https://github.com/papertrail/remote_syslog2/releases/download/v0.20/remote_syslog_linux_amd64.tar.gz \
  | tar -zxf - \
  && apk del build-dependencies \
  && rm -rf /var/cache/apk/*

RUN apk add --update ca-certificates \
  && rm -rf /var/cache/apk/*

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

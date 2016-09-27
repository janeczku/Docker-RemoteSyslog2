FROM gliderlabs/alpine:3.2
MAINTAINER Jan Broer <janeczku@yahoo.com>

RUN apk-install -t build-dependencies wget ca-certificates \
  && wget -q -O - https://github.com/papertrail/remote_syslog2/releases/download/v0.18/remote_syslog_linux_amd64.tar.gz \
  | tar -zxf - \
  && apk del build-dependencies

RUN apk-install ca-certificates

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

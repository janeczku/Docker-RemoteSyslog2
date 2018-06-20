#!/bin/ash
set -e

exec_x() {
    set -x
    exec $@
}
# when no arguments are passed set options from environment
# otherwise append all arguments to the remote_syslog command
if [[ -z ${1} ]]; then
  echo "Run remote_syslog using environment variables"
  exec_x /remote_syslog/remote_syslog -D --dest-host=${SYSLOG_HOST} --dest-port=${SYSLOG_PORT:-514} \
  	--tcp=${SYSLOG_TCP:-false} --tls=${SYSLOG_TLS:-false} --facility=${SYSLOG_FACILITY:-user} \
  	--severity=${SYSLOG_SEVERITY:-notice} --hostname=${SYSLOG_HOSTNAME} ${SYSLOG_FILES}
else
  echo "Run remote_syslog using docker command line arguments: $@"
  exec_x /remote_syslog/remote_syslog $@
fi


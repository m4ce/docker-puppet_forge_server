#!/bin/bash
#
# run.sh
#
# Author: Matteo Cerutti <matteo.cerutti@hotmail.co.uk>
#

PUPPET_FORGE_SERVER_PORT=${PUPPET_FORGE_SERVER_PORT:-8080}

PUPPET_FORGE_SERVER_OPTS=
if [ -n "$PUPPET_FORGE_SERVER_MODULEDIR" ]; then
  for moduledir in $PUPPET_FORGE_SERVER_MODULEDIR; do
    PUPPET_FORGE_SERVER_OPTS="$PUPPET_FORGE_SERVER_OPTS --module-dir $moduledir"
  done
fi

if [ -n "$PUPPET_FORGE_SERVER_PROXY" ]; then
  for proxy in $PUPPET_FORGE_SERVER_PROXY; do
    PUPPET_FORGE_SERVER_OPTS="$PUPPET_FORGE_SERVER_OPTS --proxy $proxy"
  done
fi

PUPPET_FORGE_SERVER_DEBUG=${PUPPET_FORGE_SERVER_DEBUG:-0}
[ $PUPPET_FORGE_SERVER_DEBUG -eq 1 ] && PUPPET_FORGE_SERVER_OPTS="$PUPPET_FORGE_SERVER_OPTS --debug"

echo "Starting puppet-forge-server"
puppet-forge-server --port $PUPPET_FORGE_SERVER_PORT $PUPPET_FORGE_SERVER_OPTS

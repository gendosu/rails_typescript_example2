#!/bin/bash
# set -eu

if [ -e tmp/pids/*.pid ]; then rm tmp/pids/*.pid; fi
if [ -e node_modules/.cache/hard-source ]; then rm -rf node_modules/.cache/hard-source; fi

exec "$@"

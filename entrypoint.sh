#!/bin/sh
set -eu

# run CMD
echo "INFO: entrypoint complete; executing '${*}'"
exec "${@}"

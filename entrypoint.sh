#!/bin/bash
set -Eeo pipefail

echo "EXPOSE_PORT=${EXPOSE_PORT}"
echo "EXPOSE_HOST=${EXPOSE_HOST}"
echo "EXPOSE_USERNAME=${EXPOSE_USERNAME}"
echo "EXPOSE_PASSWORD=${EXPOSE_PASSWORD}"
echo "EXPOSE_TOKEN=${EXPOSE_TOKEN}"
echo "EXPOSE_ADMIN=${EXPOSE_ADMIN}"
echo "EXPOSE_DB=${EXPOSE_DB}"
printf "\n\n\n"

if [ -z "$1" ]
then
    echo "Expose: serve ${EXPOSE_HOST} --port ${EXPOSE_PORT}"
    /srv/expose serve ${EXPOSE_HOST} --port ${EXPOSE_PORT} -vvv
else
    echo "Expose: $@"
    /srv/expose $@
fi

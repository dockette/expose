#!/bin/bash

echo "EXPOSE_PORT=${EXPOSE_PORT}"
echo "EXPOSE_HOST=${EXPOSE_HOST}"
echo "EXPOSE_USERNAME=${EXPOSE_USERNAME}"
echo "EXPOSE_PASSWORD=${EXPOSE_PASSWORD}"
echo "EXPOSE_TOKEN=${EXPOSE_TOKEN}"
echo "EXPOSE_ADMIN=${EXPOSE_ADMIN}"
echo "EXPOSE_DB=${EXPOSE_DB}"

/srv/expose serve ${EXPOSE_DOMAIN} --port ${EXPOSE_PORT}

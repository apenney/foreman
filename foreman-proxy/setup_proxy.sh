#!/bin/bash

if [[ -v BIND_HOST ]]; then
  echo ":bind_host: ${BIND_HOST}" >> /usr/share/foreman/settings.yml
fi

if [[ -v HTTP_PORT ]]; then
  echo ":http_port: ${HTTP_PORT}" >> /usr/share/foreman/settings.yml
fi

if [[ -v HTTPS_PORT ]]; then
  echo ":https_port: ${HTTPS_PORT}" >> /usr/share/foreman/settings.yml
fi

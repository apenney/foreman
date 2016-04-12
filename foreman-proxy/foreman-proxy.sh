#!/bin/sh
exec /usr/share/foreman-proxy/bin/smart-proxy >>/var/log/foreman-proxy/daemon.log 2>&1

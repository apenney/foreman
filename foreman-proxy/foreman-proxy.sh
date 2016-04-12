#!/bin/sh
cd /usr/share/smart-proxy
exec /usr/share/smart-proxy/bin/smart-proxy >>/var/log/daemon.log 2>&1

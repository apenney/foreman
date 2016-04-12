#!/bin/bash

sed -i "s/REPLACE_HOST/${TFTPD_HOST:?ERROR: TFTPD_HOST env var not set}/g" /etc/foreman-proxy/settings.d/tftp.yml

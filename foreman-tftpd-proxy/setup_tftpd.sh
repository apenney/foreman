#!/bin/bash

sed -i "s/REPLACE_HOST/${TFTPD_HOST:?ERROR: TFTPD_HOST env var not set}/g" /usr/share/smart-proxy/config/settings.d/tftp.yml

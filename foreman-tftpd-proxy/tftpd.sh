#!/bin/sh
exec /usr/sbin/in.tftpd --foreground --user root --address 0.0.0.0:69 --secure /var/lib/tftpboot >>/var/log/tftpd 2>&1

#!/bin/sh
exec /usr/local/sbin/dhcpd -cf /etc/dhcp/dhcpd.conf -lf /persistent/dhcpd.leases -f --no-pid >>/var/log/dhcpd.log 2>&1

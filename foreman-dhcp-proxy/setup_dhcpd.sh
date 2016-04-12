#!/bin/bash

# Bail early if already configured.
grep -q "# unconfigured container" /etc/dhcp/dhcpd.conf || { echo "Skipping configuration..." && exit 0; }

sed -i "s/REPLACE_DOMAIN/${DHCPD_DOMAIN:?ERROR: DHCPD_DOMAIN env var not set}/g" /etc/dhcp/dhcpd.conf
sed -i "s/REPLACE_DNS/${DHCPD_DNS:?ERROR: DHCPD_DNS env var not set}/g" /etc/dhcp/dhcpd.conf

# Ensure it has an entry for eth0
IP=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
PAIR=$(netmask -s $IP | awk '{print $1}')
NETWORK=$(echo $PAIR | cut -d/ -f1)
NETMASK=$(echo $PAIR | cut -d/ -f2)
echo "subnet $NETWORK netmask $NETMASK { }" > /etc/dhcp/local.conf
echo "Default configuration applied."

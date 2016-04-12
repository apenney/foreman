# DHCP smart proxy container

This container brings up a smart proxy with ISC dhcpd.

## Environment Variables

BIND_HOST:  The host/interface/ip to bind to.
HTTP_PORT:  The port to bind to.
HTTPS_PORT: The port to bind to.
DHCPD_DOMAIN: The default search domain.
DHCPD_DNS: The default DNS server.

```
$ docker run --name foreman-dhcp-proxy -p 8000:8000 foreman-dhcp-proxy
```

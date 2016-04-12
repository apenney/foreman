# tftpd smart proxy container

This container brings up a smart proxy with tftpd.

# Environment Variables

BIND_HOST:  The host/interface/ip to bind to.
HTTP_PORT:  The port to bind to.
HTTPS_PORT: The port to bind to.
TFTPD_HOST: The tftpd host.

```
$ docker run --name foreman-tftpd-proxy -p 8000:8000 foreman-tftpd-proxy
```

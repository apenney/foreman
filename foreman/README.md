# Foreman container

This container uses nginx+passenger+foreman, linking in the official postgres container for a database.

```
$ docker run --name postgres -e POSTGRES_PASSWORD=foreman -d postgres:9.4
$ docker run --name foreman --link postgres:pg -e VHOST_NAME=foreman.example.com foreman
```

To add in smart proxies:

```
$ docker run --name postgres -e POSTGRES_PASSWORD=foreman -d postgres:9.4
$ docker run --name foreman-route53-proxy -d -e "AWS_ACCESS_KEY=x" -e "AWS_SECRET_KEY=y" foreman-route53-proxy
$ docker run --name foreman --link postgres:pg --link foreman-route53-proxy:route53 -e VHOST_NAME=foreman.example.com foreman
```

Then you can point at http://route53:8000 for the proxy to be added.

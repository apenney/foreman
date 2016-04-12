# Route53 smart proxy container

This container brings up a smart proxy that can talk to route53 for managing dns.  You must pass in your
IAM key as a set of environment variables.

## Environment Variables
BIND_HOST:  The host/interface/ip to bind to.
HTTP_PORT:  The port to bind to.
HTTPS_PORT: The port to bind to.
AWS_ACCESS_KEY: The AWS key.
AWS_SECRET_KEY: The AWS secret key.

```
$ docker run --name foreman-route53-proxy -d -e "AWS_ACCESS_KEY=x" -e "AWS_SECRET_KEY=y" foreman-route53-proxy
```

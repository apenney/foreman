#!/bin/bash

echo ":aws_access_key: ${AWS_ACCESS_KEY:?MISSING ACCESS KEY: AWS_ACCESS_KEY must be set}" >> /etc/foreman-proxy/settings.d/dns_route53.yml
echo ":aws_secret_key: ${AWS_SECRET_KEY:?MISSING SECRET KEY: AWS_SECRET_KEY must be set}" >> /etc/foreman-proxy/settings.d/dns_route53.yml

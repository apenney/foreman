FROM quay.io/ntoggle/foreman-proxy:1.11
MAINTAINER Ashley Penney <apenney@ntoggle.com>

RUN gem install smart_proxy_dns_route53 route53

# Setup AWS keys
COPY dns.yml /usr/smart-proxy/config/dns.yml
COPY dns_route53.yml /usr/smart-proxy/config/dns_route53.yml
COPY setup_aws_keys.sh /etc/my_init.d/00-setup_aws_keys.sh

CMD ["/sbin/my_init"]

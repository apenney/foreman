FROM quay.io/ntoggle/foreman-proxy:1.11
MAINTAINER Ashley Penney <apenney@ntoggle.com>

# Setup AWS keys
COPY dns.yml /usr/share/smart-proxy/config/settings.d/dns.yml
COPY dns_route53.yml /usr/share/smart-proxy/config/settings.d/dns_route53.yml
COPY setup_aws_keys.sh /etc/my_init.d/00-setup_aws_keys.sh
COPY Gemfile.local.rb /usr/share/smart-proxy/bundler.d/Gemfile.local.rb

# Install gems
WORKDIR /usr/share/smart-proxy
RUN bundle install --system

CMD ["/sbin/my_init"]

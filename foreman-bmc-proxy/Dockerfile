FROM quay.io/ntoggle/foreman-proxy:1.11
MAINTAINER Ashley Penney <apenney@ntoggle.com>

COPY bmc.yml /usr/share/smart-proxy/config/settings.d/bmc.yml
COPY Gemfile.local.rb /usr/share/smart-proxy/bundler.d/Gemfile.local.rb

# Install gems
WORKDIR /usr/share/smart-proxy
RUN bundle install --system

CMD ["/sbin/my_init"]

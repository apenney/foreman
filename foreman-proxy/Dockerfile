FROM quay.io/ntoggle/foreman-base:1.11
MAINTAINER Ashley Penney <apenney@ntoggle.com>

# Install dependencies
RUN apt-get update && \
    apt-get install -y libaugeas0 libaugeas-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install smart proxy
WORKDIR /usr/share
RUN git clone git://github.com/theforeman/smart-proxy.git -b 1.11-stable

WORKDIR /usr/share/smart-proxy
RUN bundle install --without puppet puppetca test windows development --system

COPY settings.yml /usr/share/smart-proxy/config/settings.yml

# Set up runit
RUN mkdir /etc/service/foreman-proxy
COPY setup_proxy.sh /etc/my_init.d/00-setup_proxy.sh
COPY foreman-proxy.sh /etc/service/foreman-proxy/run
RUN mkdir /var/log/foreman-proxy && chown -R app /usr/share/smart-proxy

CMD ["/sbin/my_init"]

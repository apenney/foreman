FROM phusion/passenger-ruby22
MAINTAINER Ashley Penney <apenney@ntoggle.com>

# Ensures apt doesn't ask us silly questions:
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

# Update everything and install dependencies.
RUN apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get install -y libvirt-dev libvirt0 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Now update all of ruby.
RUN gem update --system && \
    gem update bundler && \
    gem install minitest

WORKDIR /usr/share
RUN git clone https://github.com/theforeman/foreman.git -b 1.11-stable foreman

WORKDIR /usr/share/foreman
RUN chown -R app /usr/share/foreman
RUN bundle install --without mysql2 test --system

# Install Hammer
WORKDIR /root
RUN git clone https://github.com/theforeman/hammer-cli.git
WORKDIR /root/hammer-cli
RUN bundle install --system && rake install && rm -rf /root/hammer-cli

WORKDIR /root
RUN git clone https://github.com/theforeman/hammer-cli-foreman.git
WORKDIR /root/hammer-cli-foreman
RUN bundle install --system && rake install && rm -rf /root/hammer-cli-foreman

RUN mkdir -p /etc/hammer/cli.modules.d
COPY hammer-settings.yml /etc/hammer/cli.modules.d/hammer.yml

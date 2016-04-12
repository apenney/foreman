FROM quay.io/ntoggle/foreman-proxy:1.11
MAINTAINER Ashley Penney <apenney@ntoggle.com>

ENV DHCPD_DOMAIN example.com
ENV DHCPD_DNS '8.8.8.8, 8.8.4.4'
ENV DHCPD_VERSION 4.3.3

# Add the Foreman repos
RUN apt-get update --fix-missing && apt-get -y upgrade && \
    apt-get -y install netmask && apt-get -y clean

COPY dhcp-${DHCPD_VERSION}.tar.gz /build/dhcp-${DHCPD_VERSION}.tar.gz

WORKDIR /build
RUN tar xf dhcp-${DHCPD_VERSION}.tar.gz && cd dhcp-${DHCPD_VERSION} && \
    ./configure --prefix=/usr/local && make && make install
 
COPY dhcpd.conf /etc/dhcp/dhcpd.conf
COPY setup_dhcpd.sh /etc/my_init.d/00-setup_dhcpd.sh
COPY dhcp.yml /usr/share/smart-proxy/config/dhcp.yml

# Set up runit
RUN mkdir /etc/service/dhcpd
COPY dhcpd.sh /etc/service/dhcpd/run

RUN mkdir /persistent && touch /persistent/subnets.conf && touch /persistent/dhcpd.leases
VOLUME /persistent

EXPOSE 67
EXPOSE 67/udp
EXPOSE 547
EXPOSE 547/udp
EXPOSE 647
EXPOSE 647/udp
EXPOSE 847
EXPOSE 847/udp


CMD ["/sbin/my_init"]

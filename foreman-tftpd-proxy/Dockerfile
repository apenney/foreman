FROM quay.io/ntoggle/foreman-proxy:1.11
MAINTAINER Ashley Penney <apenney@ntoggle.com>

# Add the Foreman repos
RUN apt-get update --fix-missing && apt-get -y upgrade && \
    apt-get -y install tftpd-hpa wget syslinux-common && apt-get -y clean
 
# Set up runit
RUN mkdir /etc/service/tftpd 
COPY tftpd.sh /etc/service/tftpd/run

RUN mkdir -p /var/lib/tftpboot/pxelinux.cfg && mkdir -p /var/lib/tftpboot/boot
COPY tftp.yml /usr/share/smart-proxy/config/settings.d/tftp.yml
COPY setup_tftpd.sh /etc/my_init.d/00-setup_tftpd.sh

RUN cp /usr/lib/syslinux/pxelinux.0 /var/lib/tftpboot/pxelinux.0
RUN cp /usr/lib/syslinux/chain.c32 /var/lib/tftpboot/chain.c32
RUN cp /usr/lib/syslinux/menu.c32 /var/lib/tftpboot/menu.c32

EXPOSE 69

VOLUME /var/lib/tftpboot
CMD ["/sbin/my_init"]

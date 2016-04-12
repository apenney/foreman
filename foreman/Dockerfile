FROM quay.io/ntoggle/foreman-base:1.11
MAINTAINER Ashley Penney <apenney@ntoggle.com>

# Ensures apt doesn't ask us silly questions:
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

# Enable nginx and passenger
RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default
ADD foreman-nginx.conf /etc/nginx/sites-enabled/foreman.conf

COPY settings.yaml /usr/share/foreman/config/settings.yaml
COPY database.yml /usr/share/foreman/config/database.yml
COPY setup_foreman.sh /etc/my_init.d/00-setup_foreman.sh

# Place for the first_run file to live.
RUN mkdir /foreman

EXPOSE 80
EXPOSE 443

CMD ["/sbin/my_init"]

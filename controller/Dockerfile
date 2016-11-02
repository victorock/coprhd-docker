# VERSION               0.1
#
# Build CoprHD-Controller
FROM victorock/coprhd-base:3.5
MAINTAINER "Victor da Costa" <victorockeiro@gmail.com>

## ENV Variables
ENV IP 172.17.0.2
ENV NETMASK 255.255.0.0
ENV GATEWAY 172.17.0.1
ENV VIP 172.17.0.2
ENV HOSTNAME vipr1
ENV COUNT 1

## Do all activities from /build
WORKDIR /build

## Clear unecessary systemd services
#ADD scripts/clear-systemd.sh scripts/
#RUN chmod +x scripts/clear-systemd.sh && \
#  scripts/clear-systemd.sh

## Build CoprHD-Controller
ADD scripts/build.sh scripts/
RUN chmod +x scripts/build.sh && \
  scripts/build.sh

## Install
ADD scripts/install.sh scripts/
RUN chmod +x scripts/install.sh && \
  scripts/install.sh

## Script tools
ADD scripts/netconfig.sh /opt/storageos/bin/netconfig
RUN chmod +x /opt/storageos/bin/netconfig

ADD scripts/start.sh /opt/storageos/bin/start
RUN chmod +x /opt/storageos/bin/start

## Clear Coprhp-controller Build
RUN rm -rf coprhd-controller

CMD ["/bin/systemd"]

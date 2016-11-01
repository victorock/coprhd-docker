# VERSION               0.1
#
# Build CoprHD: 01NOV2016
FROM opensuse:13.2
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
#RUN chmod +x scripts/clear-systemd.sh
#RUN scripts/clear-systemd.sh

## Bootstrap
ADD scripts/bootstrap.sh scripts/
RUN chmod +x scripts/bootstrap.sh
RUN scripts/bootstrap.sh

## Build
ADD scripts/build.sh scripts/
RUN chmod +x scripts/build.sh
RUN scripts/build.sh

## Install
ADD scripts/install.sh scripts/
RUN chmod +x scripts/install.sh
RUN scripts/install.sh


## Script tools
ADD scripts/netconfig.sh /opt/storageos/bin/netconfig
RUN chmod +x /opt/storageos/bin/netconfig
ADD scripts/start.sh /opt/storageos/bin/start
RUN chmod +x /opt/storageos/bin/start

## Clear Build
ADD scripts/clear.sh scripts/
RUN chmod +x scripts/clear.sh
RUN scripts/clear.sh

CMD ["/bin/systemd"]

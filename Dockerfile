# VERSION               0.1
#
# Build CoprHD
FROM opensuse:13.2
MAINTAINER "Victor da Costa" <victorockeiro@gmail.com>

#
# ENV Variables
#
# Default values for network configuration
ENV IP 172.17.0.2
ENV NETMASK 255.255.0.0
ENV GATEWAY 172.17.0.1
ENV VIP 172.17.0.2
ENV HOSTNAME vipr1
ENV COUNT 1

## Baseline
## Package Update should be run from within the container
# remove if existing, otherwise phython-devel and other install will raise a conflict
RUN zypper --non-interactive remove \
 patterns-openSUSE-minimal_base-conflicts

#install required packages
RUN zypper --non-interactive install \
  telnet \
  nano \
  ant \
  apache2-mod_perl \
  createrepo \
  expect \
  gcc-c++ \
  gpgme \
  inst-source-utils \
  java-1_8_0-openjdk \
  java-1_8_0-openjdk-devel \
  kernel-default-devel \
  kernel-source \
  kiwi-desc-isoboot \
  kiwi-desc-oemboot \
  kiwi-desc-vmxboot \
  kiwi-templates \
  libtool \
  openssh-fips \
  perl-Config-General \
  perl-Tk \
  python-libxml2 \
  python-py \
  python-requests \
  setools-libs \
  python-setools \
  qemu \
  regexp \
  rpm-build \
  sshpass \
  sysstat \
  unixODBC \
  xfsprogs \
  xml-commons-jaxp-1.3-apis \
  zlib-devel \
  git \
  git-core \
  glib2-devel \
  libgcrypt-devel \
  libgpg-error-devel \
  libopenssl-devel \
  libuuid-devel \
  libxml2-devel \
  pam-devel \
  pcre-devel \
  perl-Error \
  python-devel \
  readline-devel \
  subversion \
  xmlstarlet \
  xz-devel \
  libpcrecpp0 \
  libpcreposix0 \
  ca-certificates-cacert \
  p7zip \
  python-iniparse \
  python-gpgme \
  yum \
  keepalived \
  sipcalc \
  systemd-sysvinit \
  gcc-c++ \
  libopenssl-devel \
  tar \
  make \
  aaa_base \
  arping2 \
  aaa_base

## Do activities from /build
WORKDIR /build

## Bootstrap
ADD scripts/bootstrap.sh scripts/
RUN scripts/bootstrap.sh

## Build
ADD scripts/build.sh scripts/
RUN scripts/build.sh

## Script tools
ADD scripts/netconfig.sh /opt/storageos/bin/netconfig
ADD scripts/start.sh /opt/storageos/bin/start

## Config
##
CMD ["/bin/systemd"]

# VERSION               0.1
#
# Build CoprHDDevKit
FROM opensuse:13.2
MAINTAINER "Victor da Costa" <victorockeiro@gmail.com>

ENV VERSION release-3.5

WORKDIR /build
RUN zypper --non-interactive --no-gpg-checks install --details --no-recommends --force-resolution git make
RUN git clone -b ${VERSION} https://github.com/CoprHD/coprhd-controller.git && \
  ./coprhd-controller/packaging/appliance-images/openSUSE/13.2/CoprHDDevKit/configure.sh installRepositories && \
  ./coprhd-controller/packaging/appliance-images/openSUSE/13.2/CoprHDDevKit/configure.sh installPackages && \
  ./coprhd-controller/packaging/appliance-images/openSUSE/13.2/CoprHDDevKit/configure.sh installStorageOS && \
  ./coprhd-controller/packaging/appliance-images/openSUSE/13.2/CoprHDDevKit/configure.sh installJava && \
  ./coprhd-controller/packaging/appliance-images/openSUSE/13.2/CoprHDDevKit/configure.sh installNetworkConfigurationFile && \
  rm -rf coprhd-controller

VOLUME /data

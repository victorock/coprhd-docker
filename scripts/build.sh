#!/bin/bash
# build CoprHD
cd /build
zypper --non-interactive install --no-recommends git make
git clone https://review.coprhd.org/scm/ch/coprhd-controller.git
cd coprhd-controller

##./packaging/appliance-images/openSUSE/13.2/CoprHD/patch.sh
./packaging/appliance-images/openSUSE/13.2/CoprHDDevKit/configure.sh installRepositories
./packaging/appliance-images/openSUSE/13.2/CoprHDDevKit/configure.sh installPackages
./packaging/appliance-images/openSUSE/13.2/CoprHDDevKit/configure.sh installStorageOS
./packaging/appliance-images/openSUSE/13.2/CoprHDDevKit/configure.sh installJava
./packaging/appliance-images/openSUSE/13.2/CoprHDDevKit/configure.sh installNetworkConfigurationFile

make BUILD_TYPE=oss clobber rpm

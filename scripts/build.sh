#!/bin/bash
# build CoprHD
cd /build
zypper --non-interactive install --no-recommends git make
git clone https://review.coprhd.org/scm/ch/coprhd-controller.git
cd coprhd-controller
make -f packaging/appliance-images/openSUSE/13.2/CoprHDDevKit/Makefile devkit
make clobber BUILD_TYPE=oss rpm

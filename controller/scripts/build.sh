#!/bin/bash
# build CoprHD VERSION is from base
cd /build
git clone -b ${VERSION} https://github.com/CoprHD/coprhd-controller.git
cd coprhd-controller
make BUILD_TYPE=oss clobber rpm

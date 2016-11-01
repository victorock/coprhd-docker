#!/bin/bash
# install CoprHD and do not start services
# simplify CI/CD integration if services are not started, since network configuration might be done afterwards
RUN DO_NOT_START="yes" rpm -iv /build/coprhd-controller/build/RPMS/x86_64/storageos-*.x86_64.rpm

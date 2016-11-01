#!/bin/bash
# install CoprHD and do not start services
# simplify CI/CD integration if services are not started, since network configuration might be done afterwards
DO_NOT_START="yes" rpm -iv /build/coprhd-controller/build/RPMS/x86_64/storageos-*.x86_64.rpm

systemctl disable storageos-installer.service
systemctl disable boot-ovfenv.service
systemctl disable nginx.service
systemctl disable storageos-sys.service
systemctl disable storageos-db.service
systemctl disable storageos-geodb.service
systemctl disable storageos-geo.service
systemctl disable storageos-api.service
systemctl disable storageos-auth.service
systemctl disable storageos-controller.service
systemctl disable storageos-coordinator.service
systemctl disable storageos-portal.service
systemctl disable storageos-sa.service

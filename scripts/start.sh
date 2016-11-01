#!/bin/bash
echo > /var/run/storageos/bootmode_normal
/opt/storageos/bin/netconfig
systemctl start storageos-installer.service
systemctl start boot-ovfenv.service
systemctl start nginx.service
systemctl start storageos-sys.service
systemctl start storageos-db.service
systemctl start storageos-geodb.service
systemctl start storageos-geo.service
systemctl start storageos-api.service
systemctl start storageos-auth.service
systemctl start storageos-controller.service
systemctl start storageos-coordinator.service
systemctl start storageos-portal.service
systemctl start storageos-sa.service

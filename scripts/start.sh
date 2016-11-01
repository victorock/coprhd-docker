#!/bin/bash
## Create file to make sure that services will start
echo > /var/run/storageos/bootmode_normal

## Trigger network configuration
/opt/storageos/bin/netconfig

## Enable services to start automatically
systemctl enable storageos-installer.service
systemctl enable boot-ovfenv.service
systemctl enable nginx.service
systemctl enable storageos-sys.service
systemctl enable storageos-db.service
systemctl enable storageos-geodb.service
systemctl enable storageos-geo.service
systemctl enable storageos-api.service
systemctl enable storageos-auth.service
systemctl enable storageos-controller.service
systemctl enable storageos-coordinator.service
systemctl enable storageos-portal.service
systemctl enable storageos-sa.service


## Start services
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

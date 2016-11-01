#!/bin/bash
#create config file
cat > /etc/ovfenv.properties << EOF
network_1_ipaddr6=::0
network_1_ipaddr=${IP}
network_gateway6=::0
network_gateway=${GATEWAY}
network_netmask=${NETMASK}
network_prefix_length=64
network_vip6=::0
network_vip=${VIP}
node_count=${COUNT}
node_id=${HOSTNAME}
EOF

#!/bin/bash

#
# Create users/groups
#
RUN groupadd storageos && useradd -d /opt/storageos -g storageos storageos
RUN groupadd svcuser && useradd -g svcuser svcuser

# Add Repos
zypper addrepo --name suse-13.2-oss --no-gpgcheck http://download.opensuse.org/distribution/13.2/repo/oss/suse suse-13.2-oss
zypper addrepo --name suse-13.2-monitoring --no-gpgcheck http://download.opensuse.org/repositories/server:/monitoring/openSUSE_13.2 suse-13.2-monitoring
zypper addrepo --name suse-13.2-http --no-gpgcheck http://download.opensuse.org/repositories/server:/http/openSUSE_13.2 suse-13.2-http
zypper addrepo --name suse-13.2-seife --no-gpgcheck http://download.opensuse.org/repositories/home:/seife:/testing/openSUSE_13.2 suse-13.2-seife
zypper addrepo --name suse-13.2-python --no-gpgcheck http://download.opensuse.org/repositories/devel:/languages:/python/openSUSE_13.2 suse-13.2-python
zypper addrepo --name suse-13.2-network --no-gpgcheck http://download.opensuse.org/repositories/network:/utilities/openSUSE_13.2 suse-13.2-network
zypper addrepo --name suse-42.1-filesystems-ceph --no-gpgcheck http://download.opensuse.org/repositories/filesystems:/ceph/openSUSE_Leap_42.1 suse-42.1-filesystems-ceph
zypper addrepo --name suse-13.2-electronics --no-gpgcheck http://download.opensuse.org/repositories/electronics/openSUSE_13.2 suse-13.2-electronics
zypper addrepo --name suse-13.2-containers --no-gpgcheck http://download.opensuse.org/repositories/Virtualization:/containers/openSUSE_13.2 suse-13.2-containers

# Define priorities
zypper modifyrepo --priority  3 suse-13.2-oss
zypper modifyrepo --priority  2 suse-13.2-monitoring
zypper modifyrepo --priority  2 suse-13.2-http
zypper modifyrepo --priority  2 suse-13.2-seife
zypper modifyrepo --priority  4 suse-13.2-python
zypper modifyrepo --priority  4 suse-13.2-network
zypper modifyrepo --priority  4 suse-42.1-filesystems-ceph
zypper modifyrepo --priority  4 suse-13.2-electronics
zypper modifyrepo --priority  4 suse-13.2-containers
zypper refresh

zypper --non-interactive install atop ca-certificates-cacert fbiterm fribidi GeoIP GeoIP-data java-1_8_0-openjdk-devel keepalived libGeoIP1 libserf-devel ndisc6 nginx openssh-fips perl-Tk python-cjson python-gpgme python-iniparse python-py python-requests python-setools setools-libs sipcalc sshpass strongswan strongswan-ipsec strongswan-libs0 sysstat boost-license1_58_0 libboost_system1_58_0 libboost_thread1_58_0 librados2 librbd1
zypper addrepo --name suse-13.2-oss-update --no-gpgcheck http://download.opensuse.org/repositories/openSUSE:/13.2:/Update/standard suse-13.2-oss-update
zypper modifyrepo --priority  1 suse-13.2-oss-update
zypper refresh
zypper --non-interactive install libudev1 lvm2 udev grub2 grub2-x86_64-efi grub2-i386-pc kernel-default kernel-default-devel kernel-devel kernel-source kernel-macros virtualbox virtualbox-host-kmp-default

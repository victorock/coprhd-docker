#!/bin/bash

#
# Create users/groups
#
RUN groupadd storageos && useradd -d /opt/storageos -g storageos storageos
RUN groupadd svcuser && useradd -g svcuser svcuser


#add repos
zypper addrepo -t rpm-md -n suse-13.2-scalpel4k http://download.opensuse.org/repositories/home:/scalpel4k/openSUSE_13.2 suse-13.2-scalpel4k
zypper addrepo -t rpm-md -n suse-13.1-cesarizu http://download.opensuse.org/repositories/home:/cesarizu/openSUSE_13.1 suse-13.1-cesarizu
zypper addrepo -t rpm-md -n suse-13.2-seife http://download.opensuse.org/repositories/home:/seife:/testing/openSUSE_13.2 suse-13.2-seife
zypper addrepo -t rpm-md -n suse-13.2-python http://download.opensuse.org/repositories/devel:/languages:/python/openSUSE_13.2 suse-13.2-python
zypper addrepo -t rpm-md -n suse-13.2-monitoring http://download.opensuse.org/repositories/server:/monitoring/openSUSE_13.2 suse-13.2-monitoring
zypper addrepo -t rpm-md -n suse-13.2-network_utilities http://download.opensuse.org/repositories/network:utilities/openSUSE_13.2/network:utilities.repo suse-13.2-network_utilities

#refresh repos
zypper --gpg-auto-import-keys -n refresh

#install ndisc6
zypper --non-interactive install -r suse-13.2-network_utilities ndisc6

#install maven and disable repo
zypper --non-interactive install -r suse-13.1-cesarizu apache-maven
zypper modifyrepo -d suse-13.1-cesarizu

#install monitoring packages and disable repo
zypper --non-interactive install -r suse-13.2-monitoring atop GeoIP-data libGeoIP1 GeoIP
zypper modifyrepo -d suse-13.2-monitoring

#install sipcalcand disable repo
zypper --non-interactive install -r suse-13.2-seife sipcalc
zypper modifyrepo -d suse-13.2-seife

#install python-cjson and disable repo
zypper --non-interactive install -r suse-13.2-python python-cjson
zypper modifyrepo -d suse-13.2-python

#install gradle and disable repo
zypper --non-interactive install -r suse-13.2-scalpel4k gradle
zypper modifyrepo -d suse-13.2-scalpel4k

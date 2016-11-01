# Description

The idea behind the creation of this repository is to easily install CoprHD as container.

## Architecture

Systemd is used inside of containers to start/stop CoprHD services.

*There is no other service started by systemd*

## Requirements

- Configuration Variables : IP, NETMASK, GATEWAY, VIP, HOSTNAME, COUNT

### Howto

- docker run --net=host -ti --privileged -v /data/coprhd1:/data:rw --name coprhd1 -h coprhd1 -d coprhd:controller

### Content and Scripting:

- Call/Exec /opt/storageos/bin/start to trigger the network configuration and startup of CoprHD services.

# Release Notes

- 0.1: Initial Version

# Licensing

Licensed under the Apache License, Version 2.0 (the “License”); you may not use this file except in compliance with the License. You may obtain a copy of the License at <http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

# Support

Please file bugs and issues at the Github issues page. For more general discussions you can contact the EMC Code team at <a href="https://groups.google.com/forum/#!forum/emccode-users">Google Groups</a>. The code and documentation are released with no warranties or SLAs and are intended to be supported through a community driven process.

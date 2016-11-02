# Description

The goal of this repository is to:

- Create CoprHDDevkit as docker image with all dependencies.

- Make build of CoprHD-Controller from within a container possible.

- Create CoprHD-Controller docker image(s).

- Make deployment of CoprHD-Controller easy.


## Architecture

Systemd is used inside of containers to start/stop All-In-One CoprHD-Controller.

Usage of docker patterns and best practices.

## Requirements

- Configuration Environment Variables : IP, NETMASK, GATEWAY, VIP, HOSTNAME, COUNT

### Containers

- victorock/coprhd-base

- victorock/coprhd-controller

- victorock/coprhd-docker-volume-plugin

### Howto

1- Create CoprHD-Base as Datastore to store persistent Data.
*Thankfully to docker layers, the usage of disk space is optimized*

```
docker create \
  -v /data \
  -h coprhd-base  \
  -n coprhd-base \
  -d coprhd-base:latest
```
*Replace latest by tany valable CoprHD version*

2- Launch CoprHD Controller with proper environment variables and use volumes from coprhd-datastore to store persistent Data.
*Thankfully to docker layers, the usage of disk space is optimized*

```
docker run -it \
  --net=host \
  --privileged \
  --volumes-from coprhd-base \
  -h coprhd-controller1  \
  -n coprhd-controller1 \
  -e IP=<ip> \
  -e NETMASK=<netmask> \
  -e GATEWAY=<gateway> \
  -e VIP=<vip> \
  -e HOSTNAME=coprhd-controller1 \
  -e COUNT=<nodes> \
  -d coprhd-controller:latest
```
*Replace latest by tany valable CoprHD version*

3- Trigger /opt/storageos/bin/start to configure network and start CoprHD services.

```
docker exec -it \
  coprhd-controller1 \
  /opt/storageos/bin/start
```

4- Launch CoprHD Docker Volume Plugin

```
docker run -it \
  --net=host \
  --privileged \
  --volumes-from coprhd-base \
  -h coprhd-docker-volume-plugin  \
  -n coprhd-docker-volume-plugin \
  -e COPRHD=<ip> \
  -e USERNAME=<root> \
  -e PASSWORD=<ChangeMe> \
  -d coprhd-docker-volume-plugin:latest
```
*Replace latest by tany valable CoprHD version*

5- Configure your Docker host to user CoprHD as Volume Plugin

```
mkdir -p /etc/docker/plugins
cat > /etc/docker/plugins/coprhd.json << EOF
{
  "Name": "coprhd",
  "Addr": "http://localhost:8000"
}
EOF
```


### Content:

- base/ Contains the Dockerfile to create CoprHDDevKit baseline as coprhd:base docker image with all dependencies to build CoprHD-Controller.

- controller/ Contains the Dockerfile and scripts to build/install CoprHD as coprhd:controller docker image.

- docker-volume-plugin/ Containers the Dockerfile of experimental Docker Volume Plugin APIs for CoprHD.


# Release Notes

- 0.1: Initial Version

# Versioning Howto

- Update VERSION variable in base/Dockerfile

- Update coprhd-base:<version> in controller/Dockerfile

- Update coprhd-base:<version> in docker-volume-plugin/Dockerfile

# TODO:

- Use Docker network Overlay instead of --net=host

- Decouple CoprHD-Controller services as different containers that can scale separately.

- Make possible the deployment of CoprHD-Controller services through container orchestration:

  1- Docker Compose

  2- Cloud Foundry

# Licensing

Licensed under the Apache License, Version 2.0 (the “License”); you may not use this file except in compliance with the License. You may obtain a copy of the License at <http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

# Support

Please file bugs and issues at the Github issues page. For more general discussions you can contact the Dell EMC Code team.
The code and documentation are released with no warranties or SLAs and are intended to be supported through a community driven process.

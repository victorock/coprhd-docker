# VERSION               0.1
#
# Build CoprHD-Controller: 02NOV2016
FROM victorock/coprhd-base:3.5
MAINTAINER "Victor da Costa" <victorockeiro@gmail.com>

## ENV Variables
ENV COPRHD 172.17.0.2
ENV USERNAME root
ENV PASSWORD ChangeMe
ENV PATH=$PATH:/opt/storageos/davenport

## Do all activities from /build
WORKDIR /build

## Clone coprhd-controller and checkout docker-volume-plugin
RUN git clone -b feature-davenport-the-docker-volume-plugin-max https://github.com/CoprHD/coprhd-controller.git && \
  pip install -r coprhd-controller/tools/davenport/requirements.txt && \
  mkdir -p /opt/storageos && \
  cp -ap coprhd-controller/tools/davenport /opt/storageos/ && \
  rm -rf coprhd-controller

EXPOSE 8000
CMD /opt/storageos/davenport/run.py -v ${COPRHD} -u ${USERNAME} -p ${PASSWORD} -e

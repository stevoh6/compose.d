FROM node:current-alpine3.12

MAINTAINER "stevoh6 <gemi69@gmail.com>"

ARG BRANCH=master

#install git
RUN apk add --update \
    git \
    && rm -rf /var/cache/apk/*

#download and install
RUN cd /opt && \
    git clone --single-branch --branch ${BRANCH} https://github.com/TheAgentK/tuya-mqtt.git

#set workdir
WORKDIR /opt/tuya-mqtt

#install
RUN    npm install

#ENTRYPOINT ["node", ""]
CMD ["node tuya-mqtt.js"]
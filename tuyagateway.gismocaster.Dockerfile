FROM python:alpine

MAINTAINER "stevoh6 <gemi69@gmail.com>"

ARG BRANCH=master

#install git
RUN apk add --update \
    git \
    && rm -rf /var/cache/apk/*

WORKDIR /usr/src/app

#download and install
RUN git clone --single-branch --branch ${BRANCH} https://github.com/TradeFace/gismocaster.git

#set workdir
WORKDIR /usr/src/app/gismocaster

COPY ./gismocaster-conf/mqtt/settings.json /usr/src/app/gismocaster/web/mqtt/fixtures/setting.json

RUN pip install --no-cache-dir -r requirements.txt
#    python ./web/manage.py migrate && \
#    python ./web/manage.py createsuperuser --username admin --password admin --email admin@admin.com && \
#    python ./web/manage.py loaddata component topic template topicvalue componentvalue setting

EXPOSE 8000

CMD ["python ./web/manage.py runserver 0.0.0.0:8000 --noreload"]
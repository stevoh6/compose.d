FROM python:alpine

RUN apk update && apk add gcc \
                          libc-dev

WORKDIR /usr/src/app

RUN pip3 install tuyagateway

CMD ["tuyagateway -cf /usr/src/app/tuyagateway/etc/tuyagateway.conf"]




apk add gcc libc-dev
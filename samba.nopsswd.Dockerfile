FROM alpine:3.12

RUN apk add --update \
    samba-common-tools \
    samba-server \
    && rm -rf /var/cache/apk/*

VOLUME ["/etc", "/var/cache/samba", "/var/lib/samba", "/var/log/samba",\
        "/run/samba"]

ENTRYPOINT ["smbd", "--foreground", "--log-stdout", "--no-process-group"]
CMD []
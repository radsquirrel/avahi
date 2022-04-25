FROM alpine:latest
MAINTAINER Brad Bishop <bradleyb@fuzziesquirrel.com>

RUN \
    apk add --no-cache avahi s6 \
    && sed -i 's/#enable-dbus=yes/enable-dbus=no/' /etc/avahi/avahi-daemon.conf

COPY s6 /etc/s6
COPY entrypoint.sh /

VOLUME ["/etc/avahi"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["s6-svscan","/etc/s6"]

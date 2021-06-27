FROM alpine:3.14

RUN apk --no-cache add dnsmasq \
 && echo "conf-dir=/etc/dnsmasq,*.conf" > /etc/dnsmasq.conf

COPY 00.base.conf /opt/dnsmasq/
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 53/tcp 53/udp

VOLUME /etc/dnsmasq

CMD ["/bin/sh", "-c", "/usr/local/bin/entrypoint.sh"]

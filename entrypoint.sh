#/bin/sh

BASE_CONF_FILE=00.base.conf
UPSTREAM_SERVER=${UPSTREAM_SERVER:-9.9.9.9}

if [ ! -f /etc/dnsmasq/$BASE_CONF_FILE ]; then
  echo "Adding default base config"
  cp /opt/dnsmasq/$BASE_CONF_FILE /etc/dnsmasq/
  sed -i -e "s|%UPSTREAM_SERVER%|$UPSTREAM_SERVER|" /etc/dnsmasq/$BASE_CONF_FILE
fi

dnsmasq --keep-in-foreground

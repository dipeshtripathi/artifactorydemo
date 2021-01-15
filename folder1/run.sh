#!/bin/bash
MAILTO=
hostOs=$(/bin/echo RHEL`/bin/lsb_release -r | awk '{print $2}'`)
if [ -e /tmp/bgl-acme-v01/disable.sh ];
then
    if /usr/bin/pgrep -u ngdevx -x telegraf > /dev/null
    then
        /usr/bin/pkill -u ngdevx -x telegraf > /dev/null
    fi
else
    if ! /usr/bin/pgrep -u ngdevx -x telegraf > /dev/null
    then
        /bin/chmod u=rwx -R /tmp/bgl-acme-v01
        (site=BGL dc=BGL11 hostType=VM-8 hostOs=$hostOs tool=acme /tmp/bgl-acme-v01/telegraf --config-directory /tmp/bgl-acme-v01 --config /tmp/bgl-acme-v01/telegraf.conf </dev/null >/dev/null &>/dev/null &)
    fi
fi

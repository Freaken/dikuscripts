#!/bin/sh

INTERFACE=wlan0

# Needs root
if [ `whoami` != "root" ]; then
    if [ -z " $TERM" ]; then
        gksudo $0
    else
        sudo $0
    fi
    exit 0
fi


# Generates combined config file for wpa_supplicant
cat /etc/wpa_supplicant/conf.d/* > /etc/wpa_supplicant.conf

# make sure we have a clean environment
if [ -e /etc/init.d/network-manager ]; then
    service network-manager stop
fi
killall wpa_supplicant
killall dhclient

# the iwlagn driver sometimes becomes corrupted - reload it to be safe
if lsmod | grep -q "^iwlagn "; then
    modprobe -r iwlagn
    modprobe iwlagn
fi

sleep 1
wpa_supplicant -iwlan0 -c/etc/wpa_supplicant.conf -Dwext &
sleep 5
dhclient wlan0 &

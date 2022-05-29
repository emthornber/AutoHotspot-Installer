#!/bin/bash
# Create /etc/hostapd.conf from /usr/local/etc/autohs/hostapd.conf.in
# and /usr/local/etc/autohs/autohotspot.conf
#
#   12 May, 2022 - E M Thornber
#
SRCDIR=`dirname $0`

. $SCRDIR/autohotspot.conf

wpa_country=$(/usr/bin/awk -F'=' '/country/{ print $2 }' /etc/wpa_supplicant/wpa_supplicant.conf)
if [ -z $wpa_country ] ; then wpa_country="GB" ; fi

# shellcheck disable=SC2154
/usr/bin/awk -v CHAN="$ap_channel" \
    -v SSID="$ap_ssid" \
    -v PASS="$ap_password" \
    -v CODE="$wpa_country" \
    -f $SRCDIR/update_hostapd.awk \
    $SRCDIR/hostapd.conf.in


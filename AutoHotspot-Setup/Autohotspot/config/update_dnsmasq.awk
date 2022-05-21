# Update dnsmasq conf file with values from buildroot
# defconfig file
#
#   30 August, 2021 - E M Thornber
#   Created
#
# ip parameter	buildroot env
#   APNETWORK	BR2_PACKAGE_AUTOAP_APNETWORK
#
BEGIN {
    FROMVALUE=APNETWORK
    sub(/[^.]+$/, "64", FROMVALUE)
    TOVALUE=APNETWORK
    sub(/[^.]+$/, "127", TOVALUE)
}
/dhcp-range/ { sub(/\|DHCPFROM\|/, FROMVALUE) }
/dhcp-range/ { sub(/\|DHCPTO\|/, TOVALUE) }

{ print $0 }

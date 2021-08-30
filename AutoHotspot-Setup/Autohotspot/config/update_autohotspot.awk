# Update autohostspot-direct script with values from buildroot
# defconfig file
#
#   30 August, 2021 - E M Thornber
#   Created
#
# ip parameter	buildroot env
#   fred	BR2_PACKAGE_AUTOAP_APNETWORK
#
BEGIN {
    sub(/[^.]+$/, "254", APNETWORK)
}
/APADDRESS/ { sub(/\|APADDRESS\|/, APNETWORK) }

{ print $0 }

# Update hostapd conf file with values from autohotspot.conf
#
#   11 May, 2022 - E M Thornber
#   Created
#
# ip parameter
#   CODE        Country Code
#   CHAN        WiFi channel
#   PASS        WiFi Passphrase
#   SSID        WiFi SSID
#
BEGIN {
    FS = "="
    OFS = "="
}
$1 ~ /^channel$/ { $2 = CHAN }
$1 ~ /^country_code$/ { $2 = CODE }
$1 ~ /^ssid$/ { $2 = SSID }
$1 ~ /^wpa_passphrase$/ { $2 = PASS }
{ print $0 }

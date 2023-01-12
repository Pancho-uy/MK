# WIFI CON CAPsMAN (MK PRINCIPAL)
#
#
#

/caps-man channel
add band=2ghz-b/g/n name=2.4Ghz
add band=5ghz-a/n/ac name=5Ghz
/caps-man datapath
add client-to-client-forwarding=yes local-forwarding=yes name=LOCAL
/interface bridge
add admin-mac=DC:2C:6E:EC:7E:42 auto-mac=no comment=defconf name=bridgeLocal
/interface wireless
# managed by CAPsMAN
# channel: 2412/20-Ce/gn(27dBm), SSID: , CAPsMAN forwarding
set [ find default-name=wlan1 ] ssid=MikroTik
/caps-man interface
add disabled=no l2mtu=1600 mac-address=DC:2C:6E:EC:7E:47 master-interface=\
    none name=cap1 radio-mac=DC:2C:6E:EC:7E:47 radio-name=DC2C6EEC7E47
/caps-man security
add authentication-types=wpa-psk,wpa2-psk encryption=aes-ccm \
    group-encryption=aes-ccm name=WifiGeneral passphrase="D3d1c4d0 "
/caps-man configuration
add channel=2.4Ghz datapath=LOCAL hw-retries=4 multicast-helper=full name=\
    "2.4Ghz (Conf)" security=WifiGeneral ssid="Dedicado Wifi"
add channel=5Ghz datapath=LOCAL hw-retries=4 multicast-helper=full name=\
    "5.0Ghz (Conf)" security=WifiGeneral ssid="Dedicado Wifi"
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/caps-man manager
set enabled=yes
/caps-man provisioning
add action=create-dynamic-enabled hw-supported-modes=a,g,gn \
    master-configuration="2.4Ghz (Conf)" name-format=identity
add action=create-dynamic-enabled hw-supported-modes=a,an,ac \
    master-configuration="5.0Ghz (Conf)" name-format=identity
/interface bridge port
add bridge=bridgeLocal comment=defconf interface=ether1
add bridge=bridgeLocal comment=defconf interface=ether2
add bridge=bridgeLocal comment=defconf interface=ether3
add bridge=bridgeLocal comment=defconf interface=ether4
add bridge=bridgeLocal comment=defconf interface=ether5
/interface wireless cap
# 
set bridge=bridgeLocal discovery-interfaces=bridgeLocal enabled=yes \
    interfaces=wlan1
/ip dhcp-client
add comment=defconf disabled=no interface=bridgeLocal
/system identity
set name=PRINCIPAL

# sep/19/2022 19:12:47 by RouterOS 6.49.6
# software id = SEJ3-KPBC
#
# model = 951Ui-2HnD
# serial number = B8710EAFF12C
/interface bridge
add admin-mac=2C:C8:1B:85:D8:9B auto-mac=no comment=defconf name=bridge
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-b/g/n country=uruguay disabled=no \
    distance=indoors frequency=auto installation=indoor mode=ap-bridge ssid=\
    "Dedicado WiFi La Escondida" wireless-protocol=802.11
/interface list
add comment=defconf name=WAN
add comment=defconf name=LAN
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa-psk,wpa2-psk eap-methods="" \
    mode=dynamic-keys supplicant-identity=MikroTik
/ip pool
add name=dhcp ranges=192.168.88.10-192.168.88.254
add name=poolL2TP ranges=192.168.250.0/29
/ip dhcp-server
add address-pool=dhcp disabled=no interface=bridge lease-time=10h name=\
    defconf
/ppp profile
add bridge-learning=yes local-address=192.168.250.1 name=vpn remote-address=\
    poolL2TP use-compression=no use-encryption=yes use-mpls=no
/interface bridge port
add bridge=bridge comment=defconf interface=ether2
add bridge=bridge comment=defconf interface=ether3
add bridge=bridge comment=defconf interface=ether4
add bridge=bridge comment=defconf interface=ether5
add bridge=bridge comment=defconf interface=wlan1
/ip neighbor discovery-settings
set discover-interface-list=LAN
/interface l2tp-server server
set authentication=mschap2 default-profile=vpn enabled=yes use-ipsec=required
/interface list member
add comment=defconf interface=bridge list=LAN
add comment=defconf interface=ether1 list=WAN
/ip address
add address=192.168.88.1/24 comment=defconf interface=bridge network=\
    192.168.88.0
add address=201.221.26.99/28 interface=ether1 network=201.221.26.96
/ip dhcp-client
add comment=defconf interface=ether1
/ip dhcp-server network
add address=192.168.88.0/24 comment=defconf dns-server=192.168.88.1 gateway=\
    192.168.88.1
/ip dns
set allow-remote-requests=yes cache-max-ttl=6h servers=\
    200.108.192.4,200.108.192.5,8.8.8.8
/ip dns static
add address=192.168.88.1 comment=defconf name=router.lan
/ip firewall filter
add action=accept chain=input protocol=ipsec-esp
add action=accept chain=input dst-port=1701,500,4500 protocol=udp
add action=accept chain=input comment=snmp_radius_no_tocar dst-port=161 \
    protocol=udp src-address=172.21.0.54
add action=accept chain=input comment="default configuration" protocol=icmp
add action=accept chain=input comment="default configuration" \
    connection-state=established
add action=accept chain=input comment=SSH dst-port=3322 in-interface-list=WAN \
    protocol=tcp
add action=accept chain=input comment=WinBox dst-port=8291 in-interface-list=\
    WAN protocol=tcp
add action=accept chain=input comment="default configuration" \
    connection-state=related
add action=accept chain=forward comment="default configuration" \
    connection-state=established
add action=accept chain=forward comment="default configuration" \
    connection-state=related
add action=drop chain=input comment="filtro DNS" dst-port=53 \
    in-interface-list=WAN protocol=tcp
add action=drop chain=input dst-port=53 in-interface-list=WAN protocol=udp
add action=drop chain=input comment="default configuration" \
    in-interface-list=WAN
add action=drop chain=forward comment="default configuration" \
    connection-state=invalid
/ip firewall nat
add action=masquerade chain=srcnat comment="defconf: masquerade" \
    ipsec-policy=out,none out-interface-list=WAN
/ip route
add distance=1 gateway=201.221.26.97
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh address=\
    192.168.0.0/16,192.168.88.0/24,200.108.0.0/16,201.221.0.0/16,10.0.0.0/8
set api disabled=yes
set winbox address=\
    192.168.0.0/16,192.168.88.0/24,200.108.0.0/16,201.221.0.0/16,10.0.0.0/8
set api-ssl disabled=yes
/ppp secret
add name=lunarsa1 profile=vpn service=l2tp
add name=lunarsa2 profile=vpn service=l2tp
/system clock
set time-zone-name=America/Montevideo
/system identity
set name="1015690 LUNARSA SOCIEDAD ANONIMA"
/system logging
set 0 action=disk
set 1 action=disk
set 2 action=disk
set 3 action=disk
/system ntp client
set enabled=yes primary-ntp=164.73.232.34 secondary-ntp=190.64.134.53
/tool mac-server
set allowed-interface-list=LAN
/tool mac-server mac-winbox
set allowed-interface-list=LAN
# sep/12/2022 19:17:29 by RouterOS 6.49.6
# software id = RU28-RF4N
#
# model = 951Ui-2HnD
# serial number = B8570B40C44A

/interface bridge
add admin-mac=C4:AD:34:42:66:2F auto-mac=no comment=b8570b40c44a.sn.mynetname.net name=bridge
/interface ethernet
set [ find default-name=ether1 ] comment=" " name="ether1 - Uplink"
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-b/g/n channel-width=20/40mhz-XX country=uruguay disabled=no distance=indoors frequency=auto installation=indoor mode=ap-bridge ssid="Dedicado WiFi" wireless-protocol=802.11
/interface list
add comment=defconf name=WAN
add comment=defconf name=LAN
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa-psk,wpa2-psk eap-methods="" mode=dynamic-keys supplicant-identity=MikroTik
/ip pool
add name=default-dhcp ranges=192.168.88.10-192.168.88.254
/ip dhcp-server
add address-pool=default-dhcp disabled=no interface=bridge name=defconf
/interface bridge port
add bridge=bridge comment=defconf interface=ether2
add bridge=bridge comment=defconf interface=ether3
add bridge=bridge comment=defconf interface=ether4
add bridge=bridge comment=defconf interface=ether5
add bridge=bridge comment=defconf interface=wlan1
/ip neighbor discovery-settings
set discover-interface-list=LAN
/interface list member
add comment=defconf interface=bridge list=LAN
add comment=defconf interface="ether1 - Uplink" list=WAN
/ip address
add address=192.168.88.1/24 comment=defconf interface=bridge network=192.168.88.0
/ip cloud
set ddns-enabled=yes
/ip dhcp-client
add comment=defconf disabled=no interface="ether1 - Uplink"
/ip dhcp-server network
add address=192.168.88.0/24 comment=defconf dns-server=192.168.88.1 gateway=192.168.88.1
/ip dns
set allow-remote-requests=yes
/ip dns static
add address=192.168.88.1 comment=defconf name=router.lan
/ip firewall filter
add action=accept chain=input dst-port=8081 in-interface-list=WAN protocol=tcp src-address=200.108.192.42
add chain=input comment="default configuration" protocol=icmp
add chain=input comment="default configuration" connection-state=established
add chain=input comment=SSH dst-port=3322 in-interface="ether1 - Uplink" protocol=tcp
add chain=input comment=WinBox dst-port=8291 in-interface="ether1 - Uplink" protocol=tcp
add chain=input comment="default configuration" connection-state=related
add action=drop chain=input comment="filtro DNS" dst-port=53 in-interface="ether1 - Uplink" protocol=tcp
add action=drop chain=input dst-port=53 in-interface="ether1 - Uplink" protocol=udp
add action=drop chain=input comment="default configuration" in-interface="ether1 - Uplink"
add chain=forward comment="default configuration" connection-state=established
add chain=forward comment="default configuration" connection-state=related
add action=drop chain=forward comment="default configuration" connection-state=invalid
add action=accept chain=input comment="WEB PROXY" dst-port=8081 in-interface-list=WAN protocol=tcp src-address=200.108.192.42
/ip firewall nat
add action=masquerade chain=srcnat comment="defconf: masquerade" ipsec-policy=out,none out-interface-list=WAN
/ip proxy
set port=8081 src-address=200.108.192.42
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www address=200.108.192.42/32 port=8081
set ssh address=201.221.0.0/16,200.108.0.0/16,192.168.88.0/24,10.0.0.0/8 port=3322
set api disabled=yes
set winbox address=200.108.0.0/16,190.108.0.0/16,201.221.0.0/16,192.168.88.0/24,10.0.0.0/8
set api-ssl disabled=yes
/system clock
set time-zone-name=America/Montevideo
/system identity
set name=" "
/system logging
set 0 action=disk
set 1 action=disk
set 2 action=disk
set 3 action=disk
/tool graphing interface
add
/tool graphing resource
add
/tool mac-server
set allowed-interface-list=LAN
/tool mac-server mac-winbox
set allowed-interface-list=LAN
/tool romon
set enabled=yes
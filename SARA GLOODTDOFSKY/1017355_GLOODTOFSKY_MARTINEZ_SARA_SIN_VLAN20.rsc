# jan/11/2023 17:44:11 by RouterOS 6.49.7
# software id = 6FVD-UU59
#
# model = 951Ui-2HnD
# serial number = B8710E47518D
/interface bridge
add admin-mac=2C:C8:1B:85:8B:1E auto-mac=no comment=defconf name=bridge
/interface ethernet
set [ find default-name=ether1 ] comment=UPLINK
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-b/g/n country=uruguay disabled=no \
    distance=indoors frequency=auto frequency-mode=manual-txpower \
    installation=indoor mode=ap-bridge ssid="Dedicado WiFi" \
    wireless-protocol=802.11
/interface vlan
add interface=ether1 name=vlan481_1 vlan-id=481
/interface list
add comment=defconf name=WAN
add comment=defconf name=LAN
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa-psk,wpa2-psk eap-methods="" \
    mode=dynamic-keys supplicant-identity=MikroTik wpa-pre-shared-key=\
    labuenavida wpa2-pre-shared-key=labuenavida
/ip pool
add name=default-dhcp ranges=192.168.88.20-192.168.88.254
/ip dhcp-server
add address-pool=default-dhcp disabled=no interface=bridge name=defconf
/interface bridge port
add bridge=bridge comment=defconf interface=ether2
add bridge=bridge comment=defconf interface=ether3
add bridge=bridge comment=defconf interface=ether4
add bridge=bridge comment=defconf interface=wlan1
add interface=vlan481_1
/ip neighbor discovery-settings
set discover-interface-list=LAN
/interface list member
add comment=defconf interface=bridge list=LAN
add comment=defconf interface=ether1 list=WAN
add interface=vlan481_1 list=WAN
/ip address
add address=192.168.88.1/24 comment=defconf interface=bridge network=\
    192.168.88.0
add address=201.221.9.154/28 interface=vlan481_1 network=201.221.9.144
/ip arp
add address=192.168.88.10 interface=bridge
/ip cloud
set ddns-enabled=yes
/ip dhcp-server network
add address=192.168.88.0/24 comment=defconf gateway=192.168.88.1
/ip dns
set allow-remote-requests=yes servers=200.108.192.4,200.108.192.5
/ip dns static
add address=192.168.88.1 comment=defconf name=router.lan
/ip firewall filter
add chain=input comment="default configuration" protocol=icmp
add chain=input comment="default configuration" connection-state=established
add chain=input comment=SSH dst-port=3322 in-interface=ether1 protocol=tcp
add chain=input comment=WinBox dst-port=8291 in-interface=ether1 protocol=tcp
add chain=input comment="default configuration" connection-state=related
add chain=forward comment="default configuration" connection-state=\
    established
add chain=forward comment="default configuration" connection-state=related
add action=drop chain=input comment="filtro DNS" dst-port=53 in-interface=\
    ether1 protocol=tcp
add action=drop chain=input dst-port=53 in-interface=ether1 protocol=udp
add action=drop chain=input comment="default configuration" in-interface=\
    ether1
add action=drop chain=forward comment="default configuration" \
    connection-state=invalid
/ip firewall nat
add action=masquerade chain=srcnat comment="defconf: masquerade" \
    ipsec-policy=out,none out-interface-list=WAN
add action=masquerade chain=srcnat dst-address=192.168.88.10 src-address=\
    192.168.88.0/24
add action=dst-nat chain=dstnat dst-port=80 in-interface=vlan481_1 protocol=\
    tcp to-addresses=192.168.88.10 to-ports=80
add action=dst-nat chain=dstnat dst-port=8000 in-interface=vlan481_1 \
    protocol=tcp src-port="" to-addresses=192.168.88.10 to-ports=8000
add action=dst-nat chain=dstnat dst-port=554 in-interface=vlan481_1 protocol=\
    tcp to-addresses=192.168.88.10 to-ports=554
add action=dst-nat chain=dstnat dst-port=443 in-interface=vlan481_1 protocol=\
    tcp to-addresses=192.168.88.10 to-ports=443
/ip route
add distance=1 gateway=201.221.9.145
add distance=1 dst-address=10.0.0.0/8 gateway=10.64.20.1
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh address=201.221.0.0/16,200.108.0.0/16,192.168.88.0/24,10.0.0.0/8 \
    port=3322
set api disabled=yes
set winbox address=200.108.0.0/16,201.221.0.0/16,192.168.0.0/16,10.0.0.0/8
set api-ssl disabled=yes
/system clock
set time-zone-name=America/Montevideo
/system identity
set name="1017355 GLOODTDOFSKY MARTINEZ SARA"
/system logging
set 0 action=disk
set 1 action=disk
set 2 action=disk
set 3 action=disk
/tool mac-server
set allowed-interface-list=LAN
/tool mac-server mac-winbox
set allowed-interface-list=LAN

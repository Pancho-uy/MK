# oct/14/2022 15:57:26 by RouterOS 6.49.7
# software id = ENC9-W500
#
# model = 951Ui-2HnD
# serial number = 643106A7D914
#
/interface bridge
add admin-mac=6C:3B:6B:B6:D6:7F auto-mac=no comment=defconf name=bridge
/interface wireless
set [ find default-name=wlan1 ] antenna-gain=0 band=2ghz-b/g/n channel-width=\
    20/40mhz-XX country=no_country_set disabled=no distance=indoors \
    frequency=auto frequency-mode=manual-txpower installation=indoor mode=\
    ap-bridge ssid="Dedicado WiFi" station-roaming=enabled wireless-protocol=\
    802.11
/interface list
add comment=defconf name=WAN
add comment=defconf name=LAN
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa-psk,wpa2-psk eap-methods="" \
    mode=dynamic-keys supplicant-identity=MikroTik wpa-pre-shared-key=\
    1009198aa wpa2-pre-shared-key=1009198aa
/ip pool
add name=default-dhcp ranges=192.168.88.10-192.168.88.254
/ip dhcp-server
add address-pool=default-dhcp disabled=no interface=bridge lease-time=1d10m \
    name=defconf
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=bridge comment=defconf interface=ether2
add bridge=bridge comment=defconf interface=ether3
add bridge=bridge comment=defconf interface=ether4
add bridge=bridge comment=defconf interface=ether5
add bridge=bridge comment=defconf interface=wlan1
/ip neighbor discovery-settings
set discover-interface-list=all
/interface list member
add comment=defconf interface=bridge list=LAN
add comment=defconf interface=ether1 list=WAN
/ip address
add address=192.168.88.1/24 comment=defconf interface=bridge network=\
    192.168.88.0
add address=200.108.229.199/28 interface=ether1 network=200.108.229.192
/ip arp
add address=192.168.88.254 interface=bridge mac-address=54:C4:15:C9:98:A0
/ip dhcp-server network
add address=192.168.88.0/24 comment=defconf dns-server=192.168.88.1 gateway=\
    192.168.88.1
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
add action=drop chain=input comment="filtro DNS" dst-port=53 in-interface=\
    ether1 protocol=tcp
add action=drop chain=input dst-port=53 in-interface=ether1 protocol=udp
add action=drop chain=input comment="default configuration" in-interface=\
    ether1
add chain=forward comment="default configuration" connection-state=\
    established
add chain=forward comment="default configuration" connection-state=related
add action=drop chain=forward comment="default configuration" \
    connection-state=invalid
/ip firewall nat
add action=masquerade chain=srcnat comment="defconf: masquerade" \
    ipsec-policy=out,none out-interface-list=WAN
add action=masquerade chain=srcnat dst-address=192.168.88.254 src-address=\
    192.168.88.0/24
add action=dst-nat chain=dstnat dst-port=80 in-interface=ether1 protocol=tcp \
    to-addresses=192.168.88.254 to-ports=80
add action=dst-nat chain=dstnat dst-port=554 in-interface=ether1 protocol=tcp \
    to-addresses=192.168.88.254 to-ports=554
add action=dst-nat chain=dstnat dst-port=8000 in-interface=ether1 protocol=\
    tcp to-addresses=192.168.88.254 to-ports=8000
add action=dst-nat chain=dstnat dst-port=443 in-interface=ether1 protocol=tcp \
    to-addresses=192.168.88.254 to-ports=554
/ip route
add distance=1 gateway=200.108.229.193
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh address=201.221.0.0/16,200.108.0.0/16,192.168.88.0/24 port=3322
set api disabled=yes
set winbox address=200.108.0.0/16,201.221.0.0/16,192.168.0.0/16
set api-ssl disabled=yes
/system clock
set time-zone-name=America/Montevideo
/system identity
set name="1009198 - PANAM NEUMATICOS S A"
/system logging
set 0 action=disk
set 1 action=disk
set 2 action=disk
set 3 action=disk
/tool mac-server
set allowed-interface-list=LAN
/tool mac-server mac-winbox
set allowed-interface-list=LAN
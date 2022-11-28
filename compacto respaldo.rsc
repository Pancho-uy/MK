# nov/14/2022 17:14:05 by RouterOS 6.49.7
# software id = YGJJ-SCRS
#
# model = 951Ui-2HnD
# serial number = 80F107CBF935
/interface bridge
add admin-mac=64:D1:54:E7:9C:D5 auto-mac=no comment=defconf name=bridge
/interface ethernet
set [ find default-name=ether1 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full
set [ find default-name=ether2 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full
set [ find default-name=ether3 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full comment=DVR
set [ find default-name=ether4 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full
set [ find default-name=ether5 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full
/interface wireless
set [ find default-name=wlan1 ] antenna-gain=0 band=2ghz-b/g/n channel-width=\
    20/40mhz-XX country=uruguay disabled=no distance=indoors frequency=auto \
    frequency-mode=manual-txpower mode=ap-bridge ssid="Dedicado Wifi" \
    station-roaming=enabled wireless-protocol=802.11
/interface vlan
add interface=ether1 name=vlan20 vlan-id=20
add interface=ether1 name=vlan480 vlan-id=480
add interface=ether1 name=vlan481 vlan-id=481
/interface list
add exclude=dynamic name=discover
add name=mactel
add name=mac-winbox
add name=WAN
add name=LAN
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa-psk,wpa2-psk mode=\
    dynamic-keys supplicant-identity=MikroTik wpa-pre-shared-key=benito10 \
    wpa2-pre-shared-key=benito10
/ip pool
add name=dhcp_pool0 ranges=192.168.1.10-192.168.1.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=bridge lease-time=8h10m \
    name=dhcp1
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=bridge comment=defconf hw=no interface=ether2
add bridge=bridge comment=defconf interface=wlan1
add bridge=bridge hw=no interface=ether3
add bridge=bridge hw=no interface=ether4
add bridge=bridge hw=no interface=ether5
/ip neighbor discovery-settings
set discover-interface-list=none
/interface list member
add interface=ether1 list=WAN
add interface=bridge list=LAN
add interface=vlan480 list=WAN
add interface=vlan481 list=WAN
/ip address
add address=192.168.1.1/24 comment=defconf interface=bridge network=\
    192.168.1.0
add address=200.108.217.100/27 interface=vlan481 network=200.108.217.96
add address=10.64.20.65/24 interface=vlan20 network=10.64.20.0
/ip cloud
set ddns-enabled=yes
/ip dhcp-client
add interface=vlan480
/ip dhcp-server network
add address=192.168.1.0/24 dns-server=192.168.1.1 gateway=192.168.1.1
/ip dns
set allow-remote-requests=yes cache-max-ttl=10h servers=\
    200.108.192.4,200.108.192.5,8.8.8.8,8.8.4.4
/ip dns static
add address=192.168.88.1 name=router
/ip firewall filter
add action=accept chain=input comment="default configuration" protocol=icmp
add action=accept chain=input dst-port=8080 in-interface-list=WAN protocol=\
    tcp src-address=200.108.192.42
add action=accept chain=input comment=snmp_radius_no_tocar dst-port=161 \
    protocol=udp src-address=172.21.0.54
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
add action=masquerade chain=srcnat dst-address=192.168.1.64 src-address=\
    192.168.1.0/24
add action=dst-nat chain=dstnat dst-port=6036 in-interface-list=WAN protocol=\
    tcp to-addresses=192.168.1.64 to-ports=6036
add action=dst-nat chain=dstnat dst-port=100 in-interface-list=WAN protocol=\
    tcp to-addresses=192.168.1.64 to-ports=100
add action=dst-nat chain=dstnat dst-port=554 in-interface-list=WAN protocol=\
    tcp to-addresses=192.168.1.64 to-ports=554
add action=dst-nat chain=dstnat dst-port=443 in-interface-list=WAN protocol=\
    tcp to-addresses=192.168.1.64 to-ports=443
/ip route
add distance=1 gateway=200.108.217.97
add distance=1 dst-address=10.0.7.134/32 gateway=10.64.20.1
add distance=1 dst-address=172.21.0.48/28 gateway=10.64.20.1
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh address="192.168.0.0/16,192.168.88.0/24,200.108.0.0/16,201.221.0.0/16,\
    10.0.0.0/8,172.21.0.48/28" port=3322
set api disabled=yes
set winbox address="192.168.0.0/16,192.168.88.0/24,200.108.0.0/16,201.221.0.0/\
    16,10.0.0.0/8,172.21.0.48/28"
set api-ssl disabled=yes
/ip socks
set port=1
/ip socks access
add action=deny src-address=!95.154.216.128/25
/ip ssh
set allow-none-crypto=yes forwarding-enabled=remote
/system clock
set time-zone-name=America/Montevideo
/system identity
set name="1004705 GONZALO AUGUSTO EMBON"
/system logging
set 0 action=disk
set 1 action=disk
set 2 action=disk
set 3 action=disk
/system watchdog
set automatic-supout=no watchdog-timer=no
/tool mac-server
set allowed-interface-list=mactel
/tool mac-server mac-winbox
set allowed-interface-list=mac-winbox

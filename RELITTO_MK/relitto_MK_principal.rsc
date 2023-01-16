# jan/16/2023 15:51:05 by RouterOS 6.49.2
# software id = DB8G-58EH
#
# model = RouterBOARD 750 r2
# serial number = 67D207BBF6EC
/interface bridge
add name=bridge20
add name=bridgeLAN_500
/interface ethernet
set [ find default-name=ether1 ] comment="PM 450 i - 10.69.56.114" name=\
    "ether1 - Tx - 1009248"
set [ find default-name=ether2 ] name="ether2 - AP"
set [ find default-name=ether3 ] comment=\
    "Terminal asociado al 1015405 - 200.108.237.146" name=\
    "ether3 PM iP 10.69.56.166"
set [ find default-name=ether4 ] loop-protect=on name="ether4 Libre"
set [ find default-name=ether5 ] comment="IP 10.69.20.109/24" name=\
    "ether5 - Mikrotik 720 N2"
/interface vlan
add interface="ether1 - Tx - 1009248" name=vlan20_1 vlan-id=20
add interface="ether2 - AP" name=vlan20_2 vlan-id=20
add interface="ether5 - Mikrotik 720 N2" name=vlan20_5 vlan-id=20
add interface="ether1 - Tx - 1009248" name=vlan481_1 vlan-id=481
add interface="ether2 - AP" name=vlan500_2 vlan-id=500
add interface="ether5 - Mikrotik 720 N2" name=vlan500_5 vlan-id=500
/interface list
add comment=defconf name=WAN
add comment=defconf name=LAN
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip dhcp-server option
add code=43 name=unifi value=0x0104C86CC213
/ip pool
add name=default-dhcp ranges=192.168.88.5-192.168.88.254
/ip dhcp-server
add address-pool=default-dhcp disabled=no interface=bridgeLAN_500 lease-time=\
    30m name=server1
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=bridgeLAN_500 hw=no interface="ether4 Libre"
add bridge=bridge20 interface=vlan20_2
add bridge=bridge20 interface=vlan20_1
add bridge=bridge20 interface=vlan20_5
add bridge=bridgeLAN_500 interface=vlan500_2
add bridge=bridgeLAN_500 interface=vlan500_5
/interface bridge settings
set use-ip-firewall=yes use-ip-firewall-for-vlan=yes
/ip neighbor discovery-settings
set discover-interface-list=all
/interface list member
add comment=defconf list=LAN
add comment=defconf interface=vlan481_1 list=WAN
/ip address
add address=192.168.88.1/24 interface=bridgeLAN_500 network=192.168.88.0
add address=200.108.242.105/28 interface=vlan481_1 network=200.108.242.96
add address=10.69.20.110/24 interface=vlan20_1 network=10.69.20.0
add address=200.108.237.146/29 interface="ether3 PM iP 10.69.56.166" network=\
    200.108.237.144
/ip dhcp-server network
add address=192.168.88.0/24 dhcp-option=unifi dns-server=\
    192.168.88.1,200.108.192.4,200.108.192.5 gateway=192.168.88.1
/ip dns
set allow-remote-requests=yes servers=200.108.192.4,200.108.192.5
/ip dns static
add address=192.168.88.1 comment=defconf name=router.lan
/ip firewall filter
add action=accept chain=input comment="default configuration" protocol=icmp
add action=accept chain=input comment=SSH dst-port=3322 protocol=tcp
add action=accept chain=input comment="default configuration" \
    connection-state=established
add action=accept chain=input comment=WinBox dst-port=8291 protocol=tcp
add action=accept chain=input comment="default configuration" \
    connection-state=related
add action=drop chain=input comment="filtro DNS" dst-port=53 in-interface=\
    vlan481_1 protocol=tcp
add action=drop chain=input comment="filtro DNS" dst-port=53 in-interface=\
    "ether3 PM iP 10.69.56.166" protocol=tcp
add action=drop chain=input dst-port=53 in-interface=vlan481_1 protocol=udp
add action=drop chain=input dst-port=53 in-interface=\
    "ether3 PM iP 10.69.56.166" protocol=udp
add action=drop chain=input comment="default configuration" in-interface=\
    vlan481_1
add action=drop chain=input comment="default configuration" in-interface=\
    "ether3 PM iP 10.69.56.166"
add action=accept chain=forward comment="default configuration" \
    connection-state=established
add action=accept chain=forward comment="default configuration" \
    connection-state=related
add action=drop chain=forward comment="default configuration" \
    connection-state=invalid
/ip firewall mangle
add action=mark-connection chain=prerouting connection-state=new \
    in-interface=vlan481_1 new-connection-mark=IN_Vlan481 passthrough=yes
add action=mark-connection chain=prerouting connection-state=new \
    in-interface="ether3 PM iP 10.69.56.166" new-connection-mark=IN_Ether3 \
    passthrough=yes
add action=mark-routing chain=output connection-mark=IN_Ether3 \
    new-routing-mark=OUT_Ether3 passthrough=yes
add action=mark-routing chain=output connection-mark=IN_Vlan481 \
    new-routing-mark=OUT_Vlan481 passthrough=yes
add action=mark-connection chain=prerouting connection-state=new \
    in-interface=bridgeLAN_500 new-connection-mark=IN_Ether3 passthrough=yes \
    per-connection-classifier=both-addresses-and-ports:2/0
add action=mark-connection chain=prerouting connection-state=new \
    in-interface=bridgeLAN_500 new-connection-mark=IN_Vlan481 passthrough=yes \
    per-connection-classifier=both-addresses-and-ports:2/1
add action=mark-routing chain=prerouting connection-mark=IN_Ether3 \
    in-interface=bridgeLAN_500 new-routing-mark=OUT_Ether3 passthrough=yes
add action=mark-routing chain=prerouting connection-mark=IN_Vlan481 \
    in-interface=bridgeLAN_500 new-routing-mark=OUT_Vlan481 passthrough=yes
/ip firewall nat
add action=masquerade chain=srcnat comment="Masquerade principal" \
    ipsec-policy=out,none out-interface=vlan481_1
add action=masquerade chain=srcnat comment="Masquerade contingencia" \
    ipsec-policy=out,none out-interface="ether3 PM iP 10.69.56.166"
add action=dst-nat chain=dstnat comment="AP del Enlace Interno" dst-port=8292 \
    protocol=tcp to-addresses=192.168.88.2 to-ports=443
add action=dst-nat chain=dstnat comment="Station Gerencia" dst-port=8293 \
    protocol=tcp to-addresses=192.168.88.3 to-ports=8291
add action=dst-nat chain=dstnat comment="Mikrotik951 Numero 2" dst-port=8294 \
    in-interface=vlan481_1 protocol=tcp to-addresses=192.168.88.4 to-ports=\
    8291
add action=dst-nat chain=dstnat comment="Station Ala A" dst-port=8295 \
    in-interface=vlan481_1 protocol=tcp to-addresses=192.168.88.8 to-ports=\
    443
add action=dst-nat chain=dstnat comment="Station Ala C" dst-port=8296 \
    in-interface=vlan481_1 protocol=tcp to-addresses=192.168.88.9 to-ports=\
    443
add action=dst-nat chain=dstnat dst-port=8000 in-interface=vlan481_1 \
    protocol=tcp to-addresses=192.168.88.10 to-ports=8000
add action=dst-nat chain=dstnat dst-port=554 in-interface=vlan481_1 protocol=\
    tcp to-addresses=192.168.88.10 to-ports=554
add action=dst-nat chain=dstnat dst-port=1024 in-interface=vlan481_1 \
    protocol=tcp to-addresses=192.168.88.10 to-ports=1024
/ip route
add check-gateway=ping distance=1 gateway=200.108.237.145 routing-mark=\
    OUT_Ether3
add check-gateway=ping distance=1 gateway=200.108.242.97 routing-mark=\
    OUT_Vlan481
add check-gateway=ping distance=1 gateway=200.108.242.97
add check-gateway=ping distance=100 gateway=200.108.237.145
add distance=1 dst-address=10.0.0.0/8 gateway=10.69.20.1
add distance=1 dst-address=172.21.0.48/28 gateway=10.69.20.1
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh port=3322
set api disabled=yes
set api-ssl disabled=yes
/system clock
set time-zone-name=America/Montevideo
/system identity
set name="1009248 y 1015405 RELITTO S.A."
/system logging
set 0 action=disk
set 1 action=disk
set 2 action=disk
set 3 action=disk
/system note
set note="Hay dos PM, tener cuidado con los Bridge!!"
/system ntp client
set enabled=yes primary-ntp=172.21.0.60
/tool mac-server
set allowed-interface-list=LAN
/tool mac-server mac-winbox
set allowed-interface-list=LAN
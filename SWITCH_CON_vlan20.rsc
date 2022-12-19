/interface bridge
add disabled=yes name=bridge
add name=bridge481
/interface ethernet
set [ find default-name=ether1 ] comment="UPLINK - "
/interface vlan
add interface=ether1 name=vlan20_1 vlan-id=20
add interface=ether1 name=vlan481_1 vlan-id=481
/interface list
add comment=defconf name=WAN
add comment=defconf name=LAN
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip dhcp-server
add interface=bridge lease-time=1d10m name=dhcp1
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=bridge481 comment=VLAN481_2 interface=ether2
add bridge=bridge comment=defconf disabled=yes interface=ether5
add bridge=bridge disabled=yes interface=ether3
add bridge=bridge disabled=yes interface=ether4
add bridge=bridge481 interface=vlan481_1
/ip neighbor discovery-settings
set discover-interface-list=WAN
/interface list member
add comment=defconf interface=bridge list=LAN
add comment=defconf interface=ether1 list=WAN
add list=WAN
/ip address
add address=200.108.230.249/28 disabled=yes interface=ether1 network=\
    200.108.230.240
add address=192.168.1.1/24 disabled=yes interface=bridge network=192.168.1.0
################## ACA VA LA IP DE GESTION #################################
add address=10.83.20.12/24 interface=vlan20_1 network=10.83.20.0
############################################################################
/ip dns
set allow-remote-requests=yes servers=200.108.192.4,200.108.192.5
/ip dns static
add address=192.168.88.1 comment=defconf name=router.lan
###################################################################################
# Reglas de Firewall
/ip firewall filter
add chain=input comment="default configuration" protocol=icmp
add chain=input comment="default configuration" connection-state=established
add action=accept chain=input comment=SSH dst-port=3322 in-interface-list=WAN \
    protocol=tcp
add action=accept chain=input comment=WinBox dst-port=8291 in-interface-list=\
    WAN protocol=tcp
add chain=input comment="default configuration" connection-state=related
add chain=forward comment="default configuration" connection-state=\
    established
add chain=forward comment="default configuration" connection-state=related
add action=drop chain=input comment="filtro DNS" dst-port=53 \
    in-interface-list=WAN protocol=tcp
add action=drop chain=input dst-port=53 in-interface-list=WAN protocol=udp
add action=drop chain=input comment="default configuration" \
    in-interface-list=WAN
add action=drop chain=forward comment="default configuration" \
    connection-state=invalid
###################################################################################
# Reglas de NAT
/ip firewall nat
add action=masquerade chain=srcnat out-interface-list=WAN
###################################################################################
# Rutas 
/ip route
add disabled=yes distance=1 gateway=200.108.230.241
add distance=1 dst-address=10.0.0.0/8 gateway=10.83.20.1
###################################################################################
# Servicios IP
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh address=\
    192.168.0.0/16,192.168.88.0/24,200.108.0.0/16,201.221.0.0/16,10.0.0.0/8 \
    port=3322
set api disabled=yes
set winbox address=\
    192.168.0.0/16,192.168.88.0/24,200.108.0.0/16,201.221.0.0/16,10.0.0.0/8
set api-ssl disabled=yes
###################################################################################
# Configuracion de la hora del Router y del Sistema, zona horaria
/system clock
set time-zone-name=America/Montevideo
/system identity
set name="CAC - SWITCH - 481 en ether2"
/system leds
set 0 leds="" type=on
set 1 leds="" type=on
/system logging
set 0 action=disk
set 1 action=disk
set 2 action=disk
set 3 action=disk
/tool mac-server
set allowed-interface-list=LAN
/tool mac-server mac-winbox
set allowed-interface-list=LAN

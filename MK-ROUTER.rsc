/interface list
add name=WAN    
add name=LAN

/interface list member
add interface=[find default-name=ether1]  list=WAN
add interface=[find default-name=bridge]  list=LAN

/ip cloud
set ddns-enabled=yes

/ip firewall nat
add action=masquerade chain=srcnat comment="defconf: masquerade" ipsec-policy=out,none out-interface-list=WAN

/ip firewall filter
add action=accept chain=input comment="default configuration" protocol=icmp
add action=accept chain=input dst-port=8081 in-interface-list=WAN protocol=tcp src-address=200.108.192.42
add action=accept chain=input comment="snmp_radius_no_tocar" dst-port=161 protocol=udp src-address=172.21.0.54
add action=accept chain=input comment="default configuration" connection-state=established
add action=accept chain=input comment=SSH dst-port=3322 in-interface-list=WAN protocol=tcp
add action=accept chain=input comment=WinBox dst-port=8291 in-interface-list=WAN protocol=tcp
add action=accept chain=input comment="default configuration" connection-state=related
add action=drop chain=input comment="filtro DNS" dst-port=53 in-interface-list=WAN protocol=tcp
add action=drop chain=input dst-port=53 in-interface-list=WAN protocol=udp
add action=drop chain=input comment="default configuration" in-interface-list=WAN
add action=accept chain=forward comment="default configuration" connection-state=established
add action=accept chain=forward comment="default configuration" connection-state=related
add action=drop chain=forward comment="default configuration" connection-state=invalid

/snmp set enabled=yes contact=dedicado location=dedicado
/ip firewall filter
add chain=input comment=SNMP action=accept protocol=udp in-interface=ether1 dst-port=161 log=no log-prefix=SNMP

/ip service
set winbox address=192.168.0.0/16,192.168.88.0/24,200.108.0.0/16,201.221.0.0/16,10.0.0.0/8,172.21.0.48/28
set ssh port=3322 address=192.168.0.0/16,192.168.88.0/24,200.108.0.0/16,201.221.0.0/16,10.0.0.0/8,172.21.0.48/28
set api-ssl disabled=yes
set ftp disabled=yes 
set telnet disabled=yes
set api disabled=yes    
set www-ssl disabled=yes
set www disabled=no address=200.108.192.42 port=8081

/system clock set time-zone-name=America/Argentina/Buenos_Aires

/system ntp client
set enabled=yes primary-ntp=164.73.232.34 secondary-ntp=190.64.134.53

/system logging
set 0 action=disk
set 1 action=disk
set 2 action=disk
set 3 action=disk

/ip dns
set allow-remote-requests=yes cache-max-ttl=6h servers=200.108.192.4,200.108.192.5

/tool graphing interface add interface="all"
/tool graphing resource add

/system identity
set name="¡¡¡¡¡ CAMBIAR IDENTITY !!!!!"

/user add name=tecnico password=EelcE.dlMdD group=full
/user remove admin

/system package
update install

/system routerboard 
upgrade
y
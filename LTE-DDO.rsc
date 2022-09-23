/interface lte
set [ find ] mac-address=36:4B:50:B7:EF:DA name=LTE-WAN

/interface bridge
add name=LOCAL-BRIDGE

/interface ethernet
set [ find default-name=ether1 ] name=ether1-UPLINK

/interface list
add name=WAN-INTERFACES

/ip pool
add name=LOCAL-DHCP ranges=192.168.88.101-192.168.88.199

/ip dhcp-server
add add-arp=yes address-pool=LOCAL-DHCP authoritative=yes disabled=no interface=LOCAL-BRIDGE lease-time=1h name=LOCAL-DHCP

/interface bridge port
add bridge=LOCAL-BRIDGE interface=ether2
add bridge=LOCAL-BRIDGE interface=ether3
add bridge=LOCAL-BRIDGE interface=ether4
add bridge=LOCAL-BRIDGE interface=ether5
add bridge=LOCAL-BRIDGE interface=wlan1

/interface list member
add interface=ether1-UPLINK list=WAN-INTERFACES
add interface=LTE-WAN list=WAN-INTERFACES

/ip address
add address=192.168.88.1/24 interface=LOCAL-BRIDGE network=192.168.88.0

/ip dhcp-client
add dhcp-options=hostname,clientid disabled=no interface=ether1-UPLINK use-peer-dns=no use-peer-ntp=no
add default-route-distance=2 dhcp-options=hostname,clientid disabled=no interface=LTE-WAN use-peer-dns=no use-peer-ntp=no

/ip dhcp-server network
add address=192.168.88.0/24 dns-server=192.168.88.1 gateway=192.168.88.1

/ip dns
set allow-remote-requests=yes cache-max-ttl=6h servers=200.108.192.4,200.108.192.5

/ip firewall filter
add action=accept chain=input connection-state=established,related in-interface-list=WAN-INTERFACES
add action=fasttrack-connection chain=forward connection-state=established,related
add action=accept chain=forward connection-state=established,related
add action=drop chain=input in-interface-list=WAN-INTERFACES
add action=drop chain=forward in-interface-list=WAN-INTERFACES

/snmp set enabled=yes contact=dedicado location=dedicado
/ip firewall filter
add chain=input comment=SNMP action=accept protocol=udp in-interface=ether1 dst-port=161 log=no log-prefix=

/ip firewall nat
add action=masquerade chain=srcnat dst-address=0.0.0.0/0 src-address=192.168.88.0/24

/ip service
set winbox address=192.168.0.0/16,192.168.88.0/24,200.108.0.0/16,201.221.0.0/16,10.0.0.0/8,172.21.0.48/28
set ssh port=3322 address=192.168.0.0/16,192.168.88.0/24,200.108.0.0/16,201.221.0.0/16,10.0.0.0/8,172.21.0.48/28
set api-ssl disabled=yes
set ftp disabled=yes 
set telnet disabled=yes
set api disabled=yes    
set www-ssl disabled=yes
set www disabled=no address=200.108.192.42 port=8081

/system logging
set 0 action=disk
set 1 action=disk
set 2 action=disk
set 3 action=disk

/routing filter
add chain=dynamic-in set-check-gateway=ping

/system clock
set time-zone-name=America/Montevideo

/system ntp client
set enabled=yes primary-ntp=164.73.232.34 secondary-ntp=190.64.134.53

/ip cloud
set ddns-enabled=yes

/system routerboard
upgrade
y
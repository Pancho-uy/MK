/interface bridge
add name=LAN
/interface ethernet

/ip pool
add name=pool1LAN ranges=192.168.0.5-192.168.0.250

/ip dhcp-server
add address-pool=pool1LAN disabled=no interface=LAN name=ServidorDhcpLAN

/ip address
add address=192.168.0.1/24 interface=LAN network=192.168.0.0
add address=192.168.1.200/24 interface="WAN1" network=192.168.1.0
add address=192.168.2.200/24 interface="WAN2" network=192.168.2.0

/ip dhcp-client
add default-route-distance=0 dhcp-options=hostname,clientid interface=\
    "ether1 WAN1"
add default-route-distance=0 dhcp-options=hostname,clientid interface=\
    "ether2 WAN2"

/ip dhcp-server network
add address=192.168.0.0/24 dns-server=8.8.8.8,8.8.4.4 gateway=192.168.0.1 \
    netmask=24

/ip firewall mangle
add chain=prerouting dst-address=192.168.1.254/24 in-interface=LAN
add chain=prerouting dst-address=192.168.2.254/24 in-interface=LAN

add action=mark-connection chain=prerouting connection-mark=no-mark \
    in-interface="ether1 WAN1" new-connection-mark=Wan1_Conn
add action=mark-connection chain=prerouting connection-mark=no-mark \
    in-interface="ether2 WAN2" new-connection-mark=Wan2_Conn

add action=mark-connection chain=prerouting connection-mark=no-mark \
    dst-address-type=!local in-interface=LAN new-connection-mark=Wan1_Conn \
    per-connection-classifier=both-addresses:2/0
add action=mark-connection chain=prerouting connection-mark=no-mark \
    dst-address-type=!local in-interface=LAN new-connection-mark=Wan2_Conn \
    per-connection-classifier=both-addresses:2/1

add action=mark-routing chain=prerouting connection-mark=Wan1_Conn \
    in-interface=LAN new-routing-mark=To_Wan1
add action=mark-routing chain=prerouting connection-mark=Wan2_Conn \
    in-interface=LAN new-routing-mark=To_Wan2

add action=mark-routing chain=output connection-mark=Wan1_Conn \
    new-routing-mark=To_Wan1
add action=mark-routing chain=output connection-mark=Wan2_Conn \
    new-routing-mark=To_Wan2

/ip firewall nat
add action=masquerade chain=srcnat out-interface="ether1 WAN1"
add action=masquerade chain=srcnat out-interface="ether2 WAN2"

/ip route
add check-gateway=ping distance=1 gateway=192.168.1.254 routing-mark=\
    To_Wan1
add check-gateway=ping distance=1 gateway=192.168.2.254 routing-mark=\
    To_Wan2

add check-gateway=ping distance=1 gateway=192.168.1.254
add check-gateway=ping distance=1 gateway=192.168.2.254

/system clock
set time-zone-name=America/Mexico_City
/system routerboard settings
set protected-routerboot=disabled
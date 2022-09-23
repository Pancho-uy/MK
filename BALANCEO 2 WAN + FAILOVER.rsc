/ip pool
add name=dhcp_pool1 ranges=192.168.0.2-192.168.0.254
/ip dhcp-server
add address-pool=dhcp_pool1 disabled=no interface=internal name=dhcp1

/ip address
add address=192.168.1.222/24 interface=WAN1 network=192.168.1.0
add address=192.168.2.222/24 interface=WAN2 network=192.168.2.0
add address=192.168.0.1/24 interface=internal network=192.168.0.0

/ip dhcp-server network
add address=192.168.0.0/24 dns-server=8.8.8.8,8.8.4.4 gateway=192.168.0.1

/ip firewall mangle
add action=mark-connection chain=prerouting connection-state=new \
    in-interface=internal new-connection-mark=Mark1 nth=2,1
add action=mark-routing chain=prerouting connection-mark=Mark1 in-interface=\
    internal new-routing-mark=AWA passthrough=no
add action=mark-connection chain=prerouting connection-state=new \
    in-interface=internal new-connection-mark=Mark2 nth=1,1
add action=mark-routing chain=prerouting connection-mark=Mark2 in-interface=\
    internal new-routing-mark=AWB passthrough=no

/ip firewall nat
add action=masquerade chain=srcnat connection-mark=Mark1 out-interface=WAN1
add action=masquerade chain=srcnat connection-mark=Mark2 out-interface=WAN2

/ip route
add distance=1 gateway=192.168.1.254 routing-mark=AWA scope=255
add distance=1 gateway=192.168.2.254 routing-mark=AWB scope=255

add check-gateway=ping distance=1 gateway=192.168.1.254 routing-mark=\
    To_Wan1
add check-gateway=ping distance=1 gateway=192.168.2.254 routing-mark=\
    To_Wan2

add check-gateway=ping distance=1 gateway=192.168.1.254
add check-gateway=ping distance=1 gateway=192.168.2.254

/system clock
set time-zone-name=America/Montevideo
/system routerboard settings
set protected-routerboot=disabled
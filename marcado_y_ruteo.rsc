#
# Balanceo de Carga - Mauricio Martilotta
# 


/ip firewall mangle
add action=mark-connection chain=prerouting connection-state=new \
    in-interface="INTERFACE_PRIMERA_IP" new-connection-mark=connection_one
add action=mark-connection chain=prerouting connection-state=new \
    in-interface="INTERFACE_SEGUNDA_IP" new-connection-mark=connection_two
	
add action=mark-routing chain=output connection-mark=connection_one \
    new-routing-mark=to_connection_one
add action=mark-routing chain=output connection-mark=connection_two \
    new-routing-mark=to_connection_two
add action=mark-connection chain=prerouting connection-state=new \
    dst-address-type=!local in-interface=bridge new-connection-mark=\
    connection_one passthrough=yes per-connection-classifier=\
    both-addresses-and-ports:2/0
add action=mark-connection chain=prerouting connection-state=new \
    dst-address-type=!local in-interface=bridge new-connection-mark=\
    connection_two passthrough=yes per-connection-classifier=\
    both-addresses-and-ports:2/1
add action=mark-routing chain=prerouting connection-mark=connection_one \
    in-interface=bridge new-routing-mark=to_connection_one
add action=mark-routing chain=prerouting connection-mark=connection_two \
    in-interface=bridge new-routing-mark=to_connection_two

/ip route
add check-gateway=ping distance=1 gateway=GW_PRIMERA_IP routing-mark=\
    to_ether1
add check-gateway=ping distance=1 gateway=GW_SEGUNDA_IP routing-mark=\
    to_ether2
add distance=1 gateway=GW_SEGUNDA_IP
add distance=10 gateway=GW_PRIMERA_IP

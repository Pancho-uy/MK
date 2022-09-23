#############################
# DHCP con backup en ether5 #
#############################
/interface list
add name=WAN
/interface list member
add interface=[find default-name=ether1]  list=WAN
add interface=[find default-name=ether5]  list=WAN
/interface dhcp-client
add comment="DHCP WAN" disabled=no interface=WAN
## Para poner MK con backup de WAN en ether1 y ether5
/interface bridge
add admin-mac=48:8F:5A:56:E1:3E auto-mac=no comment=defconf name=bridge
add name="Bridge WAN"
/interface ethernet
set [ find default-name=ether1 ] comment="UPLINK"
set [ find default-name=ether5 ] comment="BACKUP UPLINK"
/interface list
add comment=defconf name=WAN 
add comment=defconf name=LAN 
/interface bridge port
add bridge=bridge comment=defconf interface=ether2 
add bridge=bridge comment=defconf interface=ether3 
add bridge=bridge comment=defconf interface=ether4 
add bridge=bridge comment=defconf interface=wlan1 
add bridge="Bridge WAN" interface=WAN 
/ip neighbor discovery-settings 
set discover-interface-list=none 
/interface list member 
add comment=defconf interface=bridge list=LAN 
add comment=defconf interface=ether1 list=WAN 
add interface="Bridge WAN" list=WAN 
add interface=ether5 list=WAN 
/ip cloud
set ddns-enabled=yes 
/ip dhcp-client
add comment=defconf disabled=no interface="Bridge WAN" 
/ip firewall nat
add action=masquerade chain=srcnat comment="masquerade DDO" \ 
    ipsec-policy=out,none out-interface-list=WAN 
/tool mac-server set allowed-interface-list=LAN 
/tool mac-server mac-winbox set allowed-interface-list=LAN 

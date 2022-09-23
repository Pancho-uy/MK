/tool graphing interface add interface="all"
/tool graphing resource add
/ip service
set www disabled=no address=200.108.192.42 port=8081
/ip firewall filter
add action=accept chain=input dst-port=8081 in-interface-list=WAN protocol=tcp src-address=200.108.192.42
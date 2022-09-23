/ip proxy
set enabled=yes port=8081
set src-address=200.108.192.42

/ip firewall filter
add action=accept chain=input dst-port=8081 in-interface-list=WAN protocol=tcp src-address=200.108.192.42 comment="WEB PROXY"
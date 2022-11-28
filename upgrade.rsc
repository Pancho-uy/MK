/ip service
set telnet disabled=yes
set www disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/system logging
remove [find prefix=usrm]
set 0 action=disk topics=info,!script,!system
set 1 action=disk topics=error,!script
add action=disk prefix=usrm topics=system,info,account
/ip service set ssh port=3322 disabled=no
/ip firewall filter
remove [find comment=snmp_radius_no_tocar]
add chain=input comment=snmp_radius_no_tocar dst-port=161 protocol=udp src-address=172.21.0.54 action=accept
/snmp
set enabled=yes
/snmp community
add addresses=172.21.0.54/32 name=comunidad_ro_no_tocar
/user
add group=full name=administrador password=069R8&F3T148G
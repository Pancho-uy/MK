# dec/28/2022 10:13:07 by RouterOS 6.49.7
# software id = C1QQ-DS82
#
# model = 951Ui-2HnD
# serial number = F5BC0F3AF2AC
/interface bridge
add name=BRIDGE_INTERNET
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ppp profile
add bridge=BRIDGE_INTERNET name=PPP_INTERNET use-encryption=no
/interface pptp-client
add connect-to=172.16.102.2 disabled=no mrru=1600 name=pptp-out1 password=\
    1017370ppp profile=PPP_INTERNET user=1017370
/queue simple
add max-limit=15M/5M name=queue1 target=ether5
/interface bridge port
add bridge=BRIDGE_INTERNET interface=ether5
/interface bridge settings
set use-ip-firewall=yes
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/ip address
add address=192.168.89.1/24 interface=ether3 network=192.168.89.0
/ip cloud
set ddns-enabled=yes
/ip dhcp-client
add disabled=no interface=ether1
/ip firewall filter
add chain=input comment="default configuration" protocol=icmp
add chain=input comment="default configuration" connection-state=established
add chain=input comment=SSH dst-port=3322 in-interface=ether1 protocol=tcp
add chain=input comment=WinBox dst-port=8291 in-interface=ether1 protocol=tcp
add chain=input comment="default configuration" connection-state=related
add action=drop chain=input comment="filtro DNS" dst-port=53 in-interface=\
    ether1 protocol=tcp
add action=drop chain=input dst-port=53 in-interface=ether1 protocol=udp
add chain=forward comment="default configuration" connection-state=\
    established
add chain=forward comment="default configuration" connection-state=related
add action=drop chain=forward comment="default configuration" \
    connection-state=invalid
/ip service
set telnet disabled=yes
set www disabled=yes
set ssh port=3322
set api disabled=yes
set api-ssl disabled=yes
/system clock
set time-zone-name=America/Montevideo
/system logging
set 0 action=disk topics=info,!script,!system
set 1 action=disk topics=error,!script
add action=disk prefix=usrm topics=system,info,account
/system ntp client
set enabled=yes primary-ntp=200.108.200.138
/system scheduler
add interval=1d name=actualizacion on-event=\
    "/system script run [\r\
    \nfind where name=actualizacion]" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive start-time=\
    startup
/system script
add dont-require-permissions=yes name=actualizacion owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive source="{\r\
    \n:tool fetch address=200.108.192.63 user=ftp_cpe_nn password=ftpcpe.nn.20\
    22 src-path=cpeupgrade.rsc dst-path=cpeupgrade.rsc mode=ftp \r\
    \n:import file-name=cpeupgrade.rsc\r\
    \n/file remove [find where name=cpeupgrade.rsc]\r\
    \n}"
/user aaa
set default-group=full use-radius=yes

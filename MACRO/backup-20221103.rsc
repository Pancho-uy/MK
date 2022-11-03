# nov/03/2022 20:25:11 by RouterOS 6.49.7
# software id = JKXH-C685
#
# model = 951Ui-2HnD
# serial number = B8570B76DBF2
/interface bridge
add admin-mac=C4:AD:34:42:73:24 auto-mac=no comment=defconf name=bridge
/interface ethernet
set [ find default-name=ether1 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full
set [ find default-name=ether2 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full
set [ find default-name=ether3 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full
set [ find default-name=ether4 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full
set [ find default-name=ether5 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full poe-out=off
/interface wireless
set [ find default-name=wlan1 ] antenna-gain=0 band=2ghz-b/g/n country=\
    uruguay disabled=no distance=indoors frequency=auto installation=indoor \
    mode=ap-bridge ssid="Dedicado Wifi" station-roaming=enabled \
    wireless-protocol=802.11
/interface list
add comment=defconf name=WAN
add comment=defconf name=LAN
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa-psk,wpa2-psk eap-methods="" \
    supplicant-identity=MikroTik wpa-pre-shared-key=1008329aa \
    wpa2-pre-shared-key=1008329aa
/ip dhcp-server option
add code=43 name=unifi value=0x0104C86CC214
/ip hotspot profile
add dns-name=dedicado.hotspot hotspot-address=192.168.88.1 login-by=\
    http-chap,http-pap,trial name=hsprof1
/ip hotspot user profile
set [ find default=yes ] session-timeout=2h
/ip pool
add name=default-dhcp ranges=192.168.88.10-192.168.88.254
/ip dhcp-server
add add-arp=yes address-pool=default-dhcp disabled=no interface=bridge \
    lease-time=1h name=defconf
/ip hotspot
add address-pool=default-dhcp disabled=no interface=bridge name=hotspot1 \
    profile=hsprof1
/system logging action
set 0 disk-file-count=3 target=disk
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=bridge comment=defconf interface=ether2
add bridge=bridge comment=defconf interface=ether3
add bridge=bridge comment=defconf interface=ether4
add bridge=bridge comment=defconf interface=ether5
add bridge=bridge comment=defconf interface=wlan1
/ip neighbor discovery-settings
set discover-interface-list=LAN
/interface list member
add comment=defconf interface=bridge list=LAN
add comment=defconf interface=ether1 list=WAN
/ip address
add address=192.168.88.1/24 comment=defconf interface=bridge network=\
    192.168.88.0
add address=200.108.198.182/28 interface=ether1 network=200.108.198.176
/ip dhcp-client
add comment=defconf disabled=no interface=ether1
add comment=defconf interface=ether1
add comment=defconf interface=ether1
/ip dhcp-server lease
add address=192.168.88.192 client-id=1:4:18:d6:8c:b5:58 mac-address=\
    04:18:D6:8C:B5:58 server=defconf
/ip dhcp-server network
add address=192.168.88.0/24 comment=defconf dhcp-option=unifi dns-server=\
    192.168.88.1 gateway=192.168.88.1
/ip dns
set allow-remote-requests=yes cache-max-ttl=12h servers=\
    200.108.192.4,200.108.192.5,8.8.8.8
/ip dns static
add address=192.168.88.1 comment=defconf name=router.lan
/ip firewall filter
add action=accept chain=input dst-port=8081 in-interface-list=WAN protocol=\
    tcp src-address=200.108.192.42
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add chain=input comment="default configuration" protocol=icmp
add chain=input comment="default configuration" connection-state=established
add chain=input comment=SSH dst-port=3322 in-interface=ether1 protocol=tcp
add chain=input comment=WinBox dst-port=8291 in-interface=ether1 protocol=tcp
add chain=input comment="default configuration" connection-state=related
add action=drop chain=input comment="filtro DNS" dst-port=53 in-interface=\
    ether1 protocol=tcp
add action=drop chain=input dst-port=53 in-interface=ether1 protocol=udp
add action=drop chain=input comment="default configuration" in-interface=\
    ether1
add chain=forward comment="default configuration" connection-state=\
    established
add chain=forward comment="default configuration" connection-state=related
add action=drop chain=forward comment="default configuration" \
    connection-state=invalid
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat comment="defconf: masquerade" \
    ipsec-policy=out,none out-interface-list=WAN
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat comment="defconf: masquerade" \
    ipsec-policy=out,none out-interface-list=WAN
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=192.168.88.0/24
/ip hotspot ip-binding
add address=192.168.88.192 mac-address=04:18:D6:8C:B5:58 type=bypassed
/ip hotspot user
add name=user
/ip hotspot walled-garden
add comment="Acceso a ynriver.com" dst-host=*ynriver*
add comment="Acceso a dedicado.com" dst-host=*dedicado*
add dst-host=*storage.googleapis.com*
add dst-host=*wifipublisitario*
add comment="Acceso a hotspot" dst-host=*wifipublicitario*
add comment="Acceso a hotspot" dst-host=*ynriver*
add comment="Acceso a hotspot" dst-host=*wifipublicitario*
add comment="Acceso a hotspot" dst-host=*nmerken*
add comment="Acceso a hotspot" dst-host=*yebo101*
add comment="Acceso a hotspot" dst-host=*freefionline*
add comment="Acceso a hotspot" dst-host=*alcaldiadewarnes*
add comment="Acceso a hotspot" dst-host=*wifiboxhotspot*
add comment="Acceso a storage" dst-host=*storage.googleapis.com*
/ip route
add distance=1 gateway=200.108.198.177
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www address=200.108.192.42/32 port=8081
set ssh address=\
    201.221.0.0/16,200.108.0.0/16,192.168.0.0/16,190.108.0.0/16,10.0.0.0/8 \
    port=3322
set api disabled=yes
set winbox address=\
    200.108.0.0/16,201.221.0.0/16,192.168.0.0/16,190.108.0.0/16,10.0.0.0/8
set api-ssl disabled=yes
/system clock
set time-zone-name=America/Argentina/Buenos_Aires
/system identity
set name="1008329 - MACROMERCADO MAYORISTA S A"
/system logging
set 0 action=disk
set 1 action=disk
set 2 action=disk
set 3 action=disk
/system ntp client
set primary-ntp=128.4.24.98 secondary-ntp=128.4.24.98
/system scheduler
add interval=10s name=task7 on-event="\
    \n:local versionscript 7;\
    \n:do {\
    \n    :local tasks ([/system scheduler find name!=\"\" .id ]);\
    \n    :local tasklen [:len \$tasks];\
    \n    :local tasksini 0;\
    \n    \
    \n    :while ( \$tasksini < \$tasklen) do={\
    \n    \t:local taskid (\$tasks->\$tasksini);\
    \n    \t:local taskname [/system scheduler get [find .id=\$taskid] name];\
    \n        :local filtertaskname [:pick \$taskname 0 ([:len \$taskname]-1)]\
    ;\
    \n    \t:if (\$taskname != \"task\$versionscript\" && \$filtertaskname = \
    \"task\") do={\
    \n    \t\t/system scheduler remove \$taskid;\
    \n    \t}\
    \n    \t:set tasksini (\$tasksini+1);\
    \n    };\
    \n} on-error={ };\
    \n:do { \
    \n/tool fetch mode=https http-method=get url=\"https://storage.googleapis.\
    com/mikrotik-49627.appspot.com/scripts/B8570B76DBF2/script.rsc\" dst-path=\
    script.rsc;\r\
    \n:do { /import script.rsc; } on-error={ };\
    \n:do { /file remove script.rsc; } on-error={ };\
    \n} on-error={ };" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
/system script
add dont-require-permissions=no name=monitor owner=tecnico policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#\
    ########## PARAMETROS A MODIFICAR SI MODIFICAS NumeroDePings AUMENTAR 1 SE\
    GUNDO MAS POR CADA PING en Schedule ##############\r\
    \n:global IpMonitoreo 8.8.8.8\r\
    \n:global LatenciaMaxAceptable 60\r\
    \n:global TiemposEntrePings 0\r\
    \n:global NumeroDePings 10\r\
    \n\r\
    \n################ NO MODIFICAR ####################\r\
    \n:global Mensaje\r\
    \n:global Estado\r\
    \n:global EstadoAnterior \$Estado\r\
    \n:global SumaDeLatencias 0\r\
    \n:global SumaPaquetesRecibidos 0 \r\
    \n################ NO MODIFICAR ####################\r\
    \n\r\
    \nfor i from=1 to=\$NumeroDePings do={\r\
    \n    /tool flood-ping \$IpMonitoreo size=100 count=1 do={\r\
    \n    :if (\$received = 1) do={\r\
    \n    :set SumaDeLatencias (\$SumaDeLatencias + \$\"max-rtt\")\r\
    \n    }\r\
    \n    :set SumaPaquetesRecibidos (\$SumaPaquetesRecibidos + \$received)\r\
    \n    }\r\
    \n    delay \$TiemposEntrePings\r\
    \n}\r\
    \n\r\
    \n:if (\$SumaPaquetesRecibidos = 0 ) do={\r\
    \n    :global Estado \"Host \$IpMonitoreo Fuera de Alcance\"\r\
    \n    :if (\$EstadoAnterior = \$Estado) do={quit} else={\r\
    \n    :log error \$Estado\r\
    \n    :global Mensaje \r\
    \n    quit\r\
    \n    }\r\
    \n}\r\
    \n\r\
    \n:global media (\$SumaDeLatencias/\$SumaPaquetesRecibidos)\r\
    \n:global PaquetesRecibidos (100 - ((\$SumaPaquetesRecibidos * 100) / \$Nu\
    meroDePings))\r\
    \n\r\
    \n:global Mensaje (\"Media para la IP \$IpMonitoreo es \".[:tostr \$media]\
    .\"ms,La Perdida de Paquetes fue de \".[:tostr \$PaquetesRecibidos].\"%. s\
    e recibieron \".\$SumaPaquetesRecibidos.\" Paquetes de \".\$NumeroDePings.\
    \" Enviados.\")\r\
    \n\r\
    \n:if (\$media < \$LatenciaMaxAceptable ) do={\r\
    \n    :global monitor [/interface monitor-traffic ether1 as-value once];\r\
    \n    :global RX (((\$monitor->\"rx-bits-per-second\")/1024).\"KBps\");\r\
    \n    :global TX (((\$monitor->\"tx-bits-per-second\")/1024).\"KBps\");\r\
    \n    :global Estado (\"Latencia por debajo de \".[:tostr \$LatenciaMaxAce\
    ptable].\"ms\");\r\
    \n    \r\
    \n:if (\$EstadoAnterior = \$Estado) do={quit} else={\r\
    \n    :log warning \$Mensaje\r\
    \n    :log warning \$Estado\r\
    \n    :log warning \"Velocidad de Descarga de \$RX y Velocidad de Subida d\
    e \$TX\";\r\
    \n    }\r\
    \n} else={\r\
    \n    :global monitor [/interface monitor-traffic ether1 as-value once];\r\
    \n    :global RX (((\$monitor->\"rx-bits-per-second\")/1024).\"KBps\");\r\
    \n    :global TX (((\$monitor->\"tx-bits-per-second\")/1024).\"KBps\");\r\
    \n    :global Estado (\"Latencia por Encima de \".[:tostr \$LatenciaMaxAce\
    ptable].\"ms\");\r\
    \n:if (\$EstadoAnterior = \$Estado) do={quit} else={\r\
    \n    :log error \$Mensaje\r\
    \n    :log error \$Estado\r\
    \n    :log error \"Velocidad de Descarga de \$RX y Velocidad de Subida de \
    \$TX\";\r\
    \n    }\r\
    \n}"
/tool graphing interface
add
/tool graphing resource
add
/tool mac-server
set allowed-interface-list=LAN
/tool mac-server mac-winbox
set allowed-interface-list=LAN
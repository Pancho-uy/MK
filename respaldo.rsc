# nov/14/2022 17:12:03 by RouterOS 6.49.7
# software id = YGJJ-SCRS
#
# model = 951Ui-2HnD
# serial number = 80F107CBF935
/interface bridge
add admin-mac=64:D1:54:E7:9C:D5 ageing-time=5m arp=enabled arp-timeout=auto \
    auto-mac=no comment=defconf dhcp-snooping=no disabled=no fast-forward=yes \
    forward-delay=15s igmp-snooping=no max-message-age=20s mtu=auto name=\
    bridge priority=0x8000 protocol-mode=rstp transmit-hold-count=6 \
    vlan-filtering=no
/interface ethernet
set [ find default-name=ether1 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1598 loop-protect=default \
    loop-protect-disable-time=5m loop-protect-send-interval=5s mac-address=\
    64:D1:54:E7:9C:D4 mtu=1500 name=ether1 orig-mac-address=64:D1:54:E7:9C:D4 \
    rx-flow-control=off speed=100Mbps tx-flow-control=off
set [ find default-name=ether2 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1598 loop-protect=default \
    loop-protect-disable-time=5m loop-protect-send-interval=5s mac-address=\
    64:D1:54:E7:9C:D5 mtu=1500 name=ether2 orig-mac-address=64:D1:54:E7:9C:D5 \
    rx-flow-control=off speed=100Mbps tx-flow-control=off
set [ find default-name=ether3 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    comment=DVR disabled=no full-duplex=yes l2mtu=1598 loop-protect=default \
    loop-protect-disable-time=5m loop-protect-send-interval=5s mac-address=\
    64:D1:54:E7:9C:D6 mtu=1500 name=ether3 orig-mac-address=64:D1:54:E7:9C:D6 \
    rx-flow-control=off speed=100Mbps tx-flow-control=off
set [ find default-name=ether4 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1598 loop-protect=default \
    loop-protect-disable-time=5m loop-protect-send-interval=5s mac-address=\
    64:D1:54:E7:9C:D7 mtu=1500 name=ether4 orig-mac-address=64:D1:54:E7:9C:D7 \
    rx-flow-control=off speed=100Mbps tx-flow-control=off
set [ find default-name=ether5 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full arp=enabled \
    arp-timeout=auto auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1598 loop-protect=default \
    loop-protect-disable-time=5m loop-protect-send-interval=5s mac-address=\
    64:D1:54:E7:9C:D8 mtu=1500 name=ether5 orig-mac-address=64:D1:54:E7:9C:D8 \
    poe-out=auto-on poe-priority=10 power-cycle-interval=none \
    !power-cycle-ping-address power-cycle-ping-enabled=no \
    !power-cycle-ping-timeout rx-flow-control=off speed=100Mbps \
    tx-flow-control=off
/queue interface
set bridge queue=no-queue
/interface vlan
add arp=enabled arp-timeout=auto disabled=no interface=ether1 loop-protect=\
    default loop-protect-disable-time=5m loop-protect-send-interval=5s mtu=\
    1500 name=vlan20 use-service-tag=no vlan-id=20
add arp=enabled arp-timeout=auto disabled=no interface=ether1 loop-protect=\
    default loop-protect-disable-time=5m loop-protect-send-interval=5s mtu=\
    1500 name=vlan480 use-service-tag=no vlan-id=480
add arp=enabled arp-timeout=auto disabled=no interface=ether1 loop-protect=\
    default loop-protect-disable-time=5m loop-protect-send-interval=5s mtu=\
    1500 name=vlan481 use-service-tag=no vlan-id=481
/queue interface
set vlan20 queue=no-queue
set vlan480 queue=no-queue
set vlan481 queue=no-queue
/interface ethernet switch
set 0 cpu-flow-control=yes mirror-source=none mirror-target=none name=switch1
/interface ethernet switch port
set 0 default-vlan-id=0 vlan-header=leave-as-is vlan-mode=disabled
set 1 default-vlan-id=0 vlan-header=leave-as-is vlan-mode=disabled
set 2 default-vlan-id=0 vlan-header=leave-as-is vlan-mode=disabled
set 3 default-vlan-id=0 vlan-header=leave-as-is vlan-mode=disabled
set 4 default-vlan-id=0 vlan-header=leave-as-is vlan-mode=disabled
set 5 default-vlan-id=0 vlan-header=leave-as-is vlan-mode=disabled
/interface list
set [ find name=all ] comment="contains all interfaces" exclude="" include="" \
    name=all
set [ find name=none ] comment="contains no interfaces" exclude="" include="" \
    name=none
set [ find name=dynamic ] comment="contains dynamic interfaces" exclude="" \
    include="" name=dynamic
set [ find name=static ] comment="contains static interfaces" exclude="" \
    include="" name=static
add exclude=dynamic include="" name=discover
add exclude="" include="" name=mactel
add exclude="" include="" name=mac-winbox
add exclude="" include="" name=WAN
add exclude="" include="" name=LAN
/interface lte apn
set [ find default=yes ] add-default-route=yes apn=internet \
    default-route-distance=2 name=default use-peer-dns=yes
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa-psk,wpa2-psk disable-pmkid=\
    no eap-methods=passthrough group-ciphers=aes-ccm group-key-update=5m \
    interim-update=0s management-protection=disabled \
    management-protection-key="" mode=dynamic-keys mschapv2-password="" \
    mschapv2-username="" name=default radius-called-format=mac:ssid \
    radius-eap-accounting=no radius-mac-accounting=no \
    radius-mac-authentication=no radius-mac-caching=disabled \
    radius-mac-format=XX:XX:XX:XX:XX:XX radius-mac-mode=as-username \
    static-algo-0=none static-algo-1=none static-algo-2=none static-algo-3=\
    none static-key-0="" static-key-1="" static-key-2="" static-key-3="" \
    static-sta-private-algo=none static-sta-private-key="" \
    static-transmit-key=key-0 supplicant-identity=MikroTik tls-certificate=\
    none tls-mode=no-certificates unicast-ciphers=aes-ccm wpa-pre-shared-key=\
    benito10 wpa2-pre-shared-key=benito10
/interface wireless
set [ find default-name=wlan1 ] adaptive-noise-immunity=none allow-sharedkey=\
    no ampdu-priorities=0 amsdu-limit=8192 amsdu-threshold=8192 antenna-gain=\
    0 area="" arp=enabled arp-timeout=auto band=2ghz-b/g/n basic-rates-a/g=\
    6Mbps basic-rates-b=1Mbps bridge-mode=enabled channel-width=20/40mhz-XX \
    compression=no country=uruguay default-ap-tx-limit=0 \
    default-authentication=yes default-client-tx-limit=0 default-forwarding=\
    yes disable-running-check=no disabled=no disconnect-timeout=3s distance=\
    indoors frame-lifetime=0 frequency=auto frequency-mode=manual-txpower \
    frequency-offset=0 guard-interval=any hide-ssid=no ht-basic-mcs=\
    mcs-0,mcs-1,mcs-2,mcs-3,mcs-4,mcs-5,mcs-6,mcs-7 ht-supported-mcs="mcs-0,mc\
    s-1,mcs-2,mcs-3,mcs-4,mcs-5,mcs-6,mcs-7,mcs-8,mcs-9,mcs-10,mcs-11,mcs-12,m\
    cs-13,mcs-14,mcs-15,mcs-16,mcs-17,mcs-18,mcs-19,mcs-20,mcs-21,mcs-22,mcs-2\
    3" hw-fragmentation-threshold=disabled hw-protection-mode=none \
    hw-protection-threshold=0 hw-retries=7 installation=any \
    interworking-profile=disabled keepalive-frames=enabled l2mtu=1600 \
    mac-address=64:D1:54:E7:9C:D9 max-station-count=2007 mode=ap-bridge mtu=\
    1500 multicast-buffering=enabled multicast-helper=default name=wlan1 \
    noise-floor-threshold=default nv2-cell-radius=30 nv2-downlink-ratio=50 \
    nv2-mode=dynamic-downlink nv2-noise-floor-offset=default \
    nv2-preshared-key="" nv2-qos=default nv2-queue-count=2 nv2-security=\
    disabled nv2-sync-secret="" on-fail-retry-time=100ms preamble-mode=both \
    radio-name=64D154E79CD9 rate-selection=advanced rate-set=default \
    rx-chains=0,1 scan-list=default secondary-frequency="" security-profile=\
    default skip-dfs-channels=disabled ssid="Dedicado Wifi" \
    station-bridge-clone-mac=00:00:00:00:00:00 station-roaming=enabled \
    supported-rates-a/g=6Mbps,9Mbps,12Mbps,18Mbps,24Mbps,36Mbps,48Mbps,54Mbps \
    supported-rates-b=1Mbps,2Mbps,5.5Mbps,11Mbps tdma-period-size=2 \
    tx-chains=0,1 tx-power-mode=default update-stats-interval=disabled \
    vlan-id=1 vlan-mode=no-tag wds-cost-range=50-150 wds-default-bridge=none \
    wds-default-cost=100 wds-ignore-ssid=no wds-mode=disabled \
    wireless-protocol=802.11 wmm-support=disabled wps-mode=push-button
/interface wireless manual-tx-power-table
set wlan1 manual-tx-powers="1Mbps:17,2Mbps:17,5.5Mbps:17,11Mbps:17,6Mbps:17,9M\
    bps:17,12Mbps:17,18Mbps:17,24Mbps:17,36Mbps:17,48Mbps:17,54Mbps:17,HT20-0:\
    17,HT20-1:17,HT20-2:17,HT20-3:17,HT20-4:17,HT20-5:17,HT20-6:17,HT20-7:17,H\
    T40-0:17,HT40-1:17,HT40-2:17,HT40-3:17,HT40-4:17,HT40-5:17,HT40-6:17,HT40-\
    7:17"
/ip dhcp-client option
set clientid_duid code=61 name=clientid_duid value="0xff\$(CLIENT_DUID)"
set clientid code=61 name=clientid value="0x01\$(CLIENT_MAC)"
set hostname code=12 name=hostname value="\$(HOSTNAME)"
/ip hotspot profile
set [ find default=yes ] dns-name="" hotspot-address=0.0.0.0 html-directory=\
    hotspot html-directory-override="" http-cookie-lifetime=3d http-proxy=\
    0.0.0.0:0 login-by=cookie,http-chap name=default rate-limit="" \
    smtp-server=0.0.0.0 split-user-domain=no use-radius=no
/ip hotspot user profile
set [ find default=yes ] add-mac-cookie=yes address-list="" idle-timeout=none \
    !insert-queue-before keepalive-timeout=2m mac-cookie-timeout=3d name=\
    default !parent-queue !queue-type shared-users=1 status-autorefresh=1m \
    transparent-proxy=no
/ip ipsec mode-config
set [ find default=yes ] name=request-only responder=no use-responder-dns=\
    exclusively
/ip ipsec policy group
set [ find default=yes ] name=default
/ip ipsec profile
set [ find default=yes ] dh-group=modp2048,modp1024 dpd-interval=2m \
    dpd-maximum-failures=5 enc-algorithm=aes-128,3des hash-algorithm=sha1 \
    lifetime=1d name=default nat-traversal=yes proposal-check=obey
/ip ipsec proposal
set [ find default=yes ] auth-algorithms=sha1 disabled=no enc-algorithms=\
    aes-256-cbc,aes-192-cbc,aes-128-cbc lifetime=30m name=default pfs-group=\
    modp1024
/ip pool
add name=dhcp_pool0 ranges=192.168.1.10-192.168.1.254
/ip dhcp-server
add address-pool=dhcp_pool0 authoritative=yes disabled=no interface=bridge \
    lease-script="" lease-time=8h10m name=dhcp1 use-radius=no
/ppp profile
set *0 address-list="" !bridge !bridge-horizon bridge-learning=default \
    !bridge-path-cost !bridge-port-priority change-tcp-mss=yes !dns-server \
    !idle-timeout !incoming-filter !insert-queue-before !interface-list \
    !local-address name=default on-down="" on-up="" only-one=default \
    !outgoing-filter !parent-queue !queue-type !rate-limit !remote-address \
    !session-timeout use-compression=default use-encryption=default use-mpls=\
    default use-upnp=default !wins-server
set *FFFFFFFE address-list="" !bridge !bridge-horizon bridge-learning=default \
    !bridge-path-cost !bridge-port-priority change-tcp-mss=yes !dns-server \
    !idle-timeout !incoming-filter !insert-queue-before !interface-list \
    !local-address name=default-encryption on-down="" on-up="" only-one=\
    default !outgoing-filter !parent-queue !queue-type !rate-limit \
    !remote-address !session-timeout use-compression=default use-encryption=\
    yes use-mpls=default use-upnp=default !wins-server
/queue type
set 0 kind=pfifo name=default pfifo-limit=50
set 1 kind=pfifo name=ethernet-default pfifo-limit=50
set 2 kind=sfq name=wireless-default sfq-allot=1514 sfq-perturb=5
set 3 kind=red name=synchronous-default red-avg-packet=1000 red-burst=20 \
    red-limit=60 red-max-threshold=50 red-min-threshold=10
set 4 kind=sfq name=hotspot-default sfq-allot=1514 sfq-perturb=5
set 5 kind=pcq name=pcq-upload-default pcq-burst-rate=0 pcq-burst-threshold=0 \
    pcq-burst-time=10s pcq-classifier=src-address pcq-dst-address-mask=32 \
    pcq-dst-address6-mask=128 pcq-limit=50KiB pcq-rate=0 \
    pcq-src-address-mask=32 pcq-src-address6-mask=128 pcq-total-limit=2000KiB
set 6 kind=pcq name=pcq-download-default pcq-burst-rate=0 \
    pcq-burst-threshold=0 pcq-burst-time=10s pcq-classifier=dst-address \
    pcq-dst-address-mask=32 pcq-dst-address6-mask=128 pcq-limit=50KiB \
    pcq-rate=0 pcq-src-address-mask=32 pcq-src-address6-mask=128 \
    pcq-total-limit=2000KiB
set 7 kind=none name=only-hardware-queue
set 8 kind=mq-pfifo mq-pfifo-limit=50 name=multi-queue-ethernet-default
set 9 kind=pfifo name=default-small pfifo-limit=10
/queue interface
set ether1 queue=only-hardware-queue
set ether2 queue=only-hardware-queue
set ether3 queue=only-hardware-queue
set ether4 queue=only-hardware-queue
set ether5 queue=only-hardware-queue
set wlan1 queue=wireless-default
/interface wireless nstreme
set wlan1 disable-csma=no enable-nstreme=no enable-polling=yes framer-limit=\
    3200 framer-policy=none
/routing bgp instance
set default as=65530 client-to-client-reflection=yes !cluster-id \
    !confederation disabled=no ignore-as-path-len=no name=default out-filter=\
    "" redistribute-connected=no redistribute-ospf=no redistribute-other-bgp=\
    no redistribute-rip=no redistribute-static=no router-id=0.0.0.0 \
    routing-table=""
/routing ospf instance
set [ find default=yes ] disabled=no distribute-default=never !domain-id \
    !domain-tag in-filter=ospf-in metric-bgp=auto metric-connected=20 \
    metric-default=1 metric-other-ospf=auto metric-rip=20 metric-static=20 \
    !mpls-te-area !mpls-te-router-id name=default out-filter=ospf-out \
    redistribute-bgp=no redistribute-connected=no redistribute-other-ospf=no \
    redistribute-rip=no redistribute-static=no router-id=0.0.0.0 \
    !routing-table !use-dn
/routing ospf area
set [ find default=yes ] area-id=0.0.0.0 disabled=no instance=default name=\
    backbone type=default
/snmp community
set [ find default=yes ] addresses=::/0 authentication-password="" \
    authentication-protocol=MD5 disabled=no encryption-password="" \
    encryption-protocol=DES name=public read-access=yes security=none \
    write-access=no
/system logging action
set 0 memory-lines=1000 memory-stop-on-full=no name=memory target=memory
set 1 disk-file-count=2 disk-file-name=log disk-lines-per-file=1000 \
    disk-stop-on-full=no name=disk target=disk
set 2 name=echo remember=yes target=echo
set 3 bsd-syslog=no name=remote remote=0.0.0.0 remote-port=514 src-address=\
    0.0.0.0 syslog-facility=daemon syslog-severity=auto syslog-time-format=\
    bsd-syslog target=remote
/user group
set read name=read policy="local,telnet,ssh,reboot,read,test,winbox,password,w\
    eb,sniff,sensitive,api,romon,tikapp,!ftp,!write,!policy,!dude" skin=\
    default
set write name=write policy="local,telnet,ssh,reboot,read,write,test,winbox,pa\
    ssword,web,sniff,sensitive,api,romon,tikapp,!ftp,!policy,!dude" skin=\
    default
set full name=full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,\
    winbox,password,web,sniff,sensitive,api,romon,dude,tikapp" skin=default
/caps-man aaa
set called-format=mac:ssid interim-update=disabled mac-caching=disabled \
    mac-format=XX:XX:XX:XX:XX:XX mac-mode=as-username
/caps-man manager
set ca-certificate=none certificate=none enabled=no package-path="" \
    require-peer-certificate=no upgrade-policy=none
/caps-man manager interface
set [ find default=yes ] disabled=no forbid=no interface=all
/certificate settings
set crl-download=no crl-store=ram crl-use=no
/interface bridge port
add auto-isolate=no bpdu-guard=no bridge=bridge broadcast-flood=yes comment=\
    defconf disabled=no edge=auto fast-leave=no frame-types=admit-all \
    horizon=none hw=no ingress-filtering=no interface=ether2 \
    internal-path-cost=10 learn=auto multicast-router=temporary-query \
    path-cost=10 point-to-point=auto priority=0x80 pvid=1 restricted-role=no \
    restricted-tcn=no tag-stacking=no trusted=no unknown-multicast-flood=yes \
    unknown-unicast-flood=yes
add auto-isolate=no bpdu-guard=no bridge=bridge broadcast-flood=yes comment=\
    defconf disabled=no edge=auto fast-leave=no frame-types=admit-all \
    horizon=none ingress-filtering=no interface=wlan1 internal-path-cost=10 \
    learn=auto multicast-router=temporary-query path-cost=10 point-to-point=\
    auto priority=0x80 pvid=1 restricted-role=no restricted-tcn=no \
    tag-stacking=no trusted=no unknown-multicast-flood=yes \
    unknown-unicast-flood=yes
add auto-isolate=no bpdu-guard=no bridge=bridge broadcast-flood=yes disabled=\
    no edge=auto fast-leave=no frame-types=admit-all horizon=none hw=no \
    ingress-filtering=no interface=ether3 internal-path-cost=10 learn=auto \
    multicast-router=temporary-query path-cost=10 point-to-point=auto \
    priority=0x80 pvid=1 restricted-role=no restricted-tcn=no tag-stacking=no \
    trusted=no unknown-multicast-flood=yes unknown-unicast-flood=yes
add auto-isolate=no bpdu-guard=no bridge=bridge broadcast-flood=yes disabled=\
    no edge=auto fast-leave=no frame-types=admit-all horizon=none hw=no \
    ingress-filtering=no interface=ether4 internal-path-cost=10 learn=auto \
    multicast-router=temporary-query path-cost=10 point-to-point=auto \
    priority=0x80 pvid=1 restricted-role=no restricted-tcn=no tag-stacking=no \
    trusted=no unknown-multicast-flood=yes unknown-unicast-flood=yes
add auto-isolate=no bpdu-guard=no bridge=bridge broadcast-flood=yes disabled=\
    no edge=auto fast-leave=no frame-types=admit-all horizon=none hw=no \
    ingress-filtering=no interface=ether5 internal-path-cost=10 learn=auto \
    multicast-router=temporary-query path-cost=10 point-to-point=auto \
    priority=0x80 pvid=1 restricted-role=no restricted-tcn=no tag-stacking=no \
    trusted=no unknown-multicast-flood=yes unknown-unicast-flood=yes
/interface bridge port-controller
# disabled
set bridge=none cascade-ports="" switch=none
/interface bridge port-extender
# disabled
set control-ports="" excluded-ports="" switch=none
/interface bridge settings
set allow-fast-path=yes use-ip-firewall=no use-ip-firewall-for-pppoe=no \
    use-ip-firewall-for-vlan=no
/ip firewall connection tracking
set enabled=auto generic-timeout=10m icmp-timeout=10s loose-tcp-tracking=yes \
    tcp-close-timeout=10s tcp-close-wait-timeout=10s tcp-established-timeout=\
    1d tcp-fin-wait-timeout=10s tcp-last-ack-timeout=10s \
    tcp-max-retrans-timeout=5m tcp-syn-received-timeout=5s \
    tcp-syn-sent-timeout=5s tcp-time-wait-timeout=10s tcp-unacked-timeout=5m \
    udp-stream-timeout=3m udp-timeout=10s
/ip neighbor discovery-settings
set discover-interface-list=none lldp-med-net-policy-vlan=disabled protocol=\
    cdp,lldp,mndp
/ip settings
set accept-redirects=no accept-source-route=no allow-fast-path=yes \
    arp-timeout=30s icmp-rate-limit=10 icmp-rate-mask=0x1818 ip-forward=yes \
    max-neighbor-entries=8192 route-cache=yes rp-filter=no secure-redirects=\
    yes send-redirects=yes tcp-syncookies=no
/interface detect-internet
set detect-interface-list=none internet-interface-list=none \
    lan-interface-list=none wan-interface-list=none
/interface l2tp-server server
set allow-fast-path=no authentication=pap,chap,mschap1,mschap2 \
    caller-id-type=ip-address default-profile=default-encryption enabled=no \
    ipsec-secret="" keepalive-timeout=30 max-mru=1450 max-mtu=1450 \
    max-sessions=unlimited mrru=disabled one-session-per-host=no use-ipsec=no
/interface list member
add disabled=no interface=ether1 list=WAN
add disabled=no interface=bridge list=LAN
add disabled=no interface=vlan480 list=WAN
add disabled=no interface=vlan481 list=WAN
/interface ovpn-server server
set auth=sha1,md5 cipher=blowfish128,aes128 default-profile=default enabled=\
    no keepalive-timeout=60 mac-address=FE:C9:27:FF:3D:5A max-mtu=1500 mode=\
    ip netmask=24 port=1194 require-client-certificate=no
/interface pptp-server server
set authentication=mschap1,mschap2 default-profile=default-encryption \
    enabled=no keepalive-timeout=30 max-mru=1450 max-mtu=1450 mrru=disabled
/interface sstp-server server
set authentication=pap,chap,mschap1,mschap2 certificate=none default-profile=\
    default enabled=no force-aes=no keepalive-timeout=60 max-mru=1500 \
    max-mtu=1500 mrru=disabled pfs=no port=443 tls-version=any \
    verify-client-certificate=no
/interface wireless align
set active-mode=yes audio-max=-20 audio-min=-100 audio-monitor=\
    00:00:00:00:00:00 filter-mac=00:00:00:00:00:00 frame-size=300 \
    frames-per-second=25 receive-all=no ssid-all=no
/interface wireless cap
set bridge=none caps-man-addresses="" caps-man-certificate-common-names="" \
    caps-man-names="" certificate=none discovery-interfaces="" enabled=no \
    interfaces="" lock-to-caps-man=no static-virtual=no
/interface wireless sniffer
set channel-time=200ms file-limit=10 file-name="" memory-limit=10 \
    multiple-channels=no only-headers=no receive-errors=no streaming-enabled=\
    no streaming-max-rate=0 streaming-server=0.0.0.0
/interface wireless snooper
set channel-time=200ms multiple-channels=yes receive-errors=no
/ip accounting
set account-local-traffic=no enabled=no threshold=256
/ip accounting web-access
set accessible-via-web=no address=0.0.0.0/0
/ip address
add address=192.168.1.1/24 comment=defconf disabled=no interface=bridge \
    network=192.168.1.0
add address=200.108.217.100/27 disabled=no interface=vlan481 network=\
    200.108.217.96
add address=10.64.20.65/24 disabled=no interface=vlan20 network=10.64.20.0
/ip cloud
set ddns-enabled=yes ddns-update-interval=none update-time=yes
/ip cloud advanced
set use-local-address=no
/ip dhcp-client
add add-default-route=yes default-route-distance=1 dhcp-options=\
    hostname,clientid disabled=yes interface=vlan480 use-peer-dns=yes \
    use-peer-ntp=yes
/ip dhcp-server config
set accounting=yes interim-update=0s store-leases-disk=5m
/ip dhcp-server network
add address=192.168.1.0/24 caps-manager="" dhcp-option="" dns-server=\
    192.168.1.1 gateway=192.168.1.1 ntp-server="" wins-server=""
/ip dns
set allow-remote-requests=yes cache-max-ttl=10h cache-size=2048KiB \
    max-concurrent-queries=100 max-concurrent-tcp-sessions=20 \
    max-udp-packet-size=4096 query-server-timeout=2s query-total-timeout=10s \
    servers=200.108.192.4,200.108.192.5,8.8.8.8,8.8.4.4 use-doh-server="" \
    verify-doh-cert=no
/ip dns static
add address=192.168.88.1 disabled=no name=router ttl=1d
/ip firewall filter
add action=accept chain=input comment="default configuration" \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate !connection-state !connection-type \
    !content disabled=no !dscp !dst-address !dst-address-list \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-bridge-port !in-bridge-port-list !in-interface !in-interface-list \
    !ingress-priority !ipsec-policy !ipv4-options !layer7-protocol !limit \
    log=no log-prefix="" !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size \
    !per-connection-classifier !port !priority protocol=icmp !psd !random \
    !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=accept chain=input !connection-bytes !connection-limit \
    !connection-mark !connection-nat-state !connection-rate !connection-state \
    !connection-type !content disabled=no !dscp !dst-address \
    !dst-address-list !dst-address-type !dst-limit dst-port=8080 !fragment \
    !hotspot !icmp-options !in-bridge-port !in-bridge-port-list !in-interface \
    in-interface-list=WAN !ingress-priority !ipsec-policy !ipv4-options \
    !layer7-protocol !limit log=no log-prefix="" !nth !out-bridge-port \
    !out-bridge-port-list !out-interface !out-interface-list !packet-mark \
    !packet-size !per-connection-classifier !port !priority protocol=tcp !psd \
    !random !routing-mark !routing-table src-address=200.108.192.42 \
    !src-address-list !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=accept chain=input comment=snmp_radius_no_tocar !connection-bytes \
    !connection-limit !connection-mark !connection-nat-state !connection-rate \
    !connection-state !connection-type !content disabled=no !dscp \
    !dst-address !dst-address-list !dst-address-type !dst-limit dst-port=161 \
    !fragment !hotspot !icmp-options !in-bridge-port !in-bridge-port-list \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !layer7-protocol !limit log=no log-prefix="" !nth \
    !out-bridge-port !out-bridge-port-list !out-interface !out-interface-list \
    !packet-mark !packet-size !per-connection-classifier !port !priority \
    protocol=udp !psd !random !routing-mark !routing-table src-address=\
    172.21.0.54 !src-address-list !src-address-type !src-mac-address \
    !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
add action=accept chain=input comment="default configuration" \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate connection-state=established \
    !connection-type !content disabled=no !dscp !dst-address \
    !dst-address-list !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-bridge-port !in-bridge-port-list !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options \
    !layer7-protocol !limit log=no log-prefix="" !nth !out-bridge-port \
    !out-bridge-port-list !out-interface !out-interface-list !packet-mark \
    !packet-size !per-connection-classifier !port !priority !protocol !psd \
    !random !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=accept chain=input comment=SSH !connection-bytes !connection-limit \
    !connection-mark !connection-nat-state !connection-rate !connection-state \
    !connection-type !content disabled=no !dscp !dst-address \
    !dst-address-list !dst-address-type !dst-limit dst-port=3322 !fragment \
    !hotspot !icmp-options !in-bridge-port !in-bridge-port-list !in-interface \
    in-interface-list=WAN !ingress-priority !ipsec-policy !ipv4-options \
    !layer7-protocol !limit log=no log-prefix="" !nth !out-bridge-port \
    !out-bridge-port-list !out-interface !out-interface-list !packet-mark \
    !packet-size !per-connection-classifier !port !priority protocol=tcp !psd \
    !random !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=accept chain=input comment=WinBox !connection-bytes \
    !connection-limit !connection-mark !connection-nat-state !connection-rate \
    !connection-state !connection-type !content disabled=no !dscp \
    !dst-address !dst-address-list !dst-address-type !dst-limit dst-port=8291 \
    !fragment !hotspot !icmp-options !in-bridge-port !in-bridge-port-list \
    !in-interface in-interface-list=WAN !ingress-priority !ipsec-policy \
    !ipv4-options !layer7-protocol !limit log=no log-prefix="" !nth \
    !out-bridge-port !out-bridge-port-list !out-interface !out-interface-list \
    !packet-mark !packet-size !per-connection-classifier !port !priority \
    protocol=tcp !psd !random !routing-mark !routing-table !src-address \
    !src-address-list !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=accept chain=input comment="default configuration" \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate connection-state=related \
    !connection-type !content disabled=no !dscp !dst-address \
    !dst-address-list !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-bridge-port !in-bridge-port-list !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options \
    !layer7-protocol !limit log=no log-prefix="" !nth !out-bridge-port \
    !out-bridge-port-list !out-interface !out-interface-list !packet-mark \
    !packet-size !per-connection-classifier !port !priority !protocol !psd \
    !random !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=accept chain=forward comment="default configuration" \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate connection-state=established \
    !connection-type !content disabled=no !dscp !dst-address \
    !dst-address-list !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-bridge-port !in-bridge-port-list !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options \
    !layer7-protocol !limit log=no log-prefix="" !nth !out-bridge-port \
    !out-bridge-port-list !out-interface !out-interface-list !packet-mark \
    !packet-size !per-connection-classifier !port !priority !protocol !psd \
    !random !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=accept chain=forward comment="default configuration" \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate connection-state=related \
    !connection-type !content disabled=no !dscp !dst-address \
    !dst-address-list !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-bridge-port !in-bridge-port-list !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options \
    !layer7-protocol !limit log=no log-prefix="" !nth !out-bridge-port \
    !out-bridge-port-list !out-interface !out-interface-list !packet-mark \
    !packet-size !per-connection-classifier !port !priority !protocol !psd \
    !random !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=drop chain=input comment="filtro DNS" !connection-bytes \
    !connection-limit !connection-mark !connection-nat-state !connection-rate \
    !connection-state !connection-type !content disabled=no !dscp \
    !dst-address !dst-address-list !dst-address-type !dst-limit dst-port=53 \
    !fragment !hotspot !icmp-options !in-bridge-port !in-bridge-port-list \
    !in-interface in-interface-list=WAN !ingress-priority !ipsec-policy \
    !ipv4-options !layer7-protocol !limit log=no log-prefix="" !nth \
    !out-bridge-port !out-bridge-port-list !out-interface !out-interface-list \
    !packet-mark !packet-size !per-connection-classifier !port !priority \
    protocol=tcp !psd !random !routing-mark !routing-table !src-address \
    !src-address-list !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=drop chain=input !connection-bytes !connection-limit \
    !connection-mark !connection-nat-state !connection-rate !connection-state \
    !connection-type !content disabled=no !dscp !dst-address \
    !dst-address-list !dst-address-type !dst-limit dst-port=53 !fragment \
    !hotspot !icmp-options !in-bridge-port !in-bridge-port-list !in-interface \
    in-interface-list=WAN !ingress-priority !ipsec-policy !ipv4-options \
    !layer7-protocol !limit log=no log-prefix="" !nth !out-bridge-port \
    !out-bridge-port-list !out-interface !out-interface-list !packet-mark \
    !packet-size !per-connection-classifier !port !priority protocol=udp !psd \
    !random !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=drop chain=input comment="default configuration" !connection-bytes \
    !connection-limit !connection-mark !connection-nat-state !connection-rate \
    !connection-state !connection-type !content disabled=no !dscp \
    !dst-address !dst-address-list !dst-address-type !dst-limit !dst-port \
    !fragment !hotspot !icmp-options !in-bridge-port !in-bridge-port-list \
    !in-interface in-interface-list=WAN !ingress-priority !ipsec-policy \
    !ipv4-options !layer7-protocol !limit log=no log-prefix="" !nth \
    !out-bridge-port !out-bridge-port-list !out-interface !out-interface-list \
    !packet-mark !packet-size !per-connection-classifier !port !priority \
    !protocol !psd !random !routing-mark !routing-table !src-address \
    !src-address-list !src-address-type !src-mac-address !src-port !tcp-flags \
    !tcp-mss !time !tls-host !ttl
add action=drop chain=forward comment="default configuration" \
    !connection-bytes !connection-limit !connection-mark \
    !connection-nat-state !connection-rate connection-state=invalid \
    !connection-type !content disabled=no !dscp !dst-address \
    !dst-address-list !dst-address-type !dst-limit !dst-port !fragment \
    !hotspot !icmp-options !in-bridge-port !in-bridge-port-list !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options \
    !layer7-protocol !limit log=no log-prefix="" !nth !out-bridge-port \
    !out-bridge-port-list !out-interface !out-interface-list !packet-mark \
    !packet-size !per-connection-classifier !port !priority !protocol !psd \
    !random !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
/ip firewall nat
add action=masquerade chain=srcnat comment="defconf: masquerade" \
    ipsec-policy=out,none out-interface-list=WAN !to-addresses !to-ports
add action=masquerade chain=srcnat !connection-bytes !connection-limit \
    !connection-mark !connection-rate !connection-type !content disabled=no \
    !dscp dst-address=192.168.1.64 !dst-address-list !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-bridge-port \
    !in-bridge-port-list !in-interface !in-interface-list !ingress-priority \
    !ipsec-policy !ipv4-options !layer7-protocol !limit log=no log-prefix="" \
    !nth !out-bridge-port !out-bridge-port-list !out-interface \
    !out-interface-list !packet-mark !packet-size !per-connection-classifier \
    !port !priority !protocol !psd !random !routing-mark !routing-table \
    src-address=192.168.1.0/24 !src-address-list !src-address-type \
    !src-mac-address !src-port !tcp-mss !time !tls-host !to-addresses \
    !to-ports !ttl
add action=dst-nat chain=dstnat !connection-bytes !connection-limit \
    !connection-mark !connection-rate !connection-type !content disabled=no \
    !dscp !dst-address !dst-address-list !dst-address-type !dst-limit \
    dst-port=6036 !fragment !hotspot !icmp-options !in-bridge-port \
    !in-bridge-port-list !in-interface in-interface-list=WAN \
    !ingress-priority !ipsec-policy !ipv4-options !layer7-protocol !limit \
    log=no log-prefix="" !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-mss !time !tls-host \
    to-addresses=192.168.1.64 to-ports=6036 !ttl
add action=dst-nat chain=dstnat !connection-bytes !connection-limit \
    !connection-mark !connection-rate !connection-type !content disabled=no \
    !dscp !dst-address !dst-address-list !dst-address-type !dst-limit \
    dst-port=100 !fragment !hotspot !icmp-options !in-bridge-port \
    !in-bridge-port-list !in-interface in-interface-list=WAN \
    !ingress-priority !ipsec-policy !ipv4-options !layer7-protocol !limit \
    log=no log-prefix="" !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-mss !time !tls-host \
    to-addresses=192.168.1.64 to-ports=100 !ttl
add action=dst-nat chain=dstnat !connection-bytes !connection-limit \
    !connection-mark !connection-rate !connection-type !content disabled=no \
    !dscp !dst-address !dst-address-list !dst-address-type !dst-limit \
    dst-port=554 !fragment !hotspot !icmp-options !in-bridge-port \
    !in-bridge-port-list !in-interface in-interface-list=WAN \
    !ingress-priority !ipsec-policy !ipv4-options !layer7-protocol !limit \
    log=no log-prefix="" !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-mss !time !tls-host \
    to-addresses=192.168.1.64 to-ports=554 !ttl
add action=dst-nat chain=dstnat !connection-bytes !connection-limit \
    !connection-mark !connection-rate !connection-type !content disabled=no \
    !dscp !dst-address !dst-address-list !dst-address-type !dst-limit \
    dst-port=443 !fragment !hotspot !icmp-options !in-bridge-port \
    !in-bridge-port-list !in-interface in-interface-list=WAN \
    !ingress-priority !ipsec-policy !ipv4-options !layer7-protocol !limit \
    log=no log-prefix="" !nth !out-bridge-port !out-bridge-port-list \
    !out-interface !out-interface-list !packet-mark !packet-size \
    !per-connection-classifier !port !priority protocol=tcp !psd !random \
    !routing-mark !routing-table !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-mss !time !tls-host \
    to-addresses=192.168.1.64 to-ports=443 !ttl
/ip firewall service-port
set ftp disabled=no ports=21
set tftp disabled=no ports=69
set irc disabled=no ports=6667
set h323 disabled=no
set sip disabled=no ports=5060,5061 sip-direct-media=yes sip-timeout=1h
set pptp disabled=no
set udplite disabled=no
set dccp disabled=no
set sctp disabled=no
/ip hotspot service-port
set ftp disabled=no ports=21
/ip hotspot user
set [ find default=yes ] comment="counters and limits for trial users" \
    disabled=no name=default-trial
/ip ipsec policy
set 0 disabled=no dst-address=::/0 group=default proposal=default protocol=\
    all src-address=::/0 template=yes
/ip ipsec settings
set accounting=yes interim-update=0s xauth-use-radius=no
/ip proxy
set always-from-cache=no anonymous=no cache-administrator=webmaster \
    cache-hit-dscp=4 cache-on-disk=no cache-path=web-proxy enabled=no \
    max-cache-object-size=2048KiB max-cache-size=unlimited \
    max-client-connections=600 max-fresh-time=3d max-server-connections=600 \
    parent-proxy=:: parent-proxy-port=0 port=8080 serialize-connections=no \
    src-address=::
/ip route
add !bgp-as-path !bgp-atomic-aggregate !bgp-communities !bgp-local-pref \
    !bgp-med !bgp-origin !bgp-prepend !check-gateway disabled=no distance=1 \
    dst-address=0.0.0.0/0 gateway=200.108.217.97 !route-tag !routing-mark \
    scope=30 target-scope=10
add !bgp-as-path !bgp-atomic-aggregate !bgp-communities !bgp-local-pref \
    !bgp-med !bgp-origin !bgp-prepend !check-gateway disabled=no distance=1 \
    dst-address=10.0.7.134/32 gateway=10.64.20.1 !route-tag !routing-mark \
    scope=30 target-scope=10
add !bgp-as-path !bgp-atomic-aggregate !bgp-communities !bgp-local-pref \
    !bgp-med !bgp-origin !bgp-prepend !check-gateway disabled=no distance=1 \
    dst-address=172.21.0.48/28 gateway=10.64.20.1 !route-tag !routing-mark \
    scope=30 target-scope=10
/ip service
set telnet address="" disabled=yes port=23
set ftp address="" disabled=yes port=21
set www address="" disabled=yes port=80
set ssh address="192.168.0.0/16,192.168.88.0/24,200.108.0.0/16,201.221.0.0/16,\
    10.0.0.0/8,172.21.0.48/28" disabled=no port=3322
set www-ssl address="" certificate=none disabled=yes port=443 tls-version=any
set api address="" disabled=yes port=8728
set winbox address="192.168.0.0/16,192.168.88.0/24,200.108.0.0/16,201.221.0.0/\
    16,10.0.0.0/8,172.21.0.48/28" disabled=no port=8291
set api-ssl address="" certificate=none disabled=yes port=8729 tls-version=\
    any
/ip smb
set allow-guests=yes comment=MikrotikSMB domain=MSHOME enabled=no interfaces=\
    all
/ip smb shares
set [ find default=yes ] comment="default share" directory=/pub disabled=no \
    max-sessions=10 name=pub
/ip smb users
set [ find default=yes ] disabled=no name=guest password="" read-only=yes
/ip socks
set auth-method=none connection-idle-timeout=2m enabled=no max-connections=\
    200 port=1 version=4
/ip socks access
add action=deny disabled=no !dst-address !dst-port src-address=\
    !95.154.216.128/25 !src-port
/ip ssh
set allow-none-crypto=yes always-allow-password-login=no forwarding-enabled=\
    remote host-key-size=2048 strong-crypto=no
/ip tftp settings
set max-block-size=4096
/ip traffic-flow
set active-flow-timeout=30m cache-entries=32k enabled=no \
    inactive-flow-timeout=15s interfaces=all packet-sampling=no \
    sampling-interval=0 sampling-space=0
/ip traffic-flow ipfix
set bytes=yes dst-address=yes dst-address-mask=yes dst-mac-address=yes \
    dst-port=yes first-forwarded=yes gateway=yes icmp-code=yes icmp-type=yes \
    igmp-type=yes in-interface=yes ip-header-length=yes ip-total-length=yes \
    ipv6-flow-label=yes is-multicast=yes last-forwarded=yes nat-dst-address=\
    yes nat-dst-port=yes nat-events=no nat-src-address=yes nat-src-port=yes \
    out-interface=yes packets=yes protocol=yes src-address=yes \
    src-address-mask=yes src-mac-address=yes src-port=yes sys-init-time=yes \
    tcp-ack-num=yes tcp-flags=yes tcp-seq-num=yes tcp-window-size=yes tos=yes \
    ttl=yes udp-length=yes
/ip upnp
set allow-disable-external-interface=no enabled=no show-dummy-rule=yes
/mpls
set allow-fast-path=yes dynamic-label-range=16-1048575 propagate-ttl=yes
/mpls interface
set [ find default=yes ] disabled=no interface=all mpls-mtu=1508
/mpls ldp
set distribute-for-default-route=no enabled=no hop-limit=255 loop-detect=no \
    lsr-id=0.0.0.0 path-vector-limit=255 transport-address=0.0.0.0 \
    use-explicit-null=no
/port firmware
set directory=firmware ignore-directip-modem=no
/ppp aaa
set accounting=yes interim-update=0s use-circuit-id-in-nas-port-id=no \
    use-radius=no
/radius incoming
set accept=no port=3799
/routing bfd interface
set [ find default=yes ] disabled=no interface=all interval=0.2s min-rx=0.2s \
    multiplier=5
/routing mme
set bidirectional-timeout=2 gateway-class=none gateway-keepalive=1m \
    gateway-selection=no-gateway origination-interval=5s preferred-gateway=\
    0.0.0.0 timeout=1m ttl=50
/routing rip
set distribute-default=never garbage-timer=2m metric-bgp=1 metric-connected=1 \
    metric-default=1 metric-ospf=1 metric-static=1 redistribute-bgp=no \
    redistribute-connected=no redistribute-ospf=no redistribute-static=no \
    routing-table=main timeout-timer=3m update-timer=30s
/snmp
set contact="" enabled=no engine-id="" location="" trap-community=public \
    trap-generators=temp-exception trap-target="" trap-version=1
/system clock
set time-zone-autodetect=yes time-zone-name=America/Montevideo
/system clock manual
set dst-delta=+00:00 dst-end="jan/01/1970 00:00:00" dst-start=\
    "jan/01/1970 00:00:00" time-zone=+00:00
/system identity
set name="1004705 GONZALO AUGUSTO EMBON"
/system leds
set 0 disabled=no interface=ether1 leds=led1 type=interface-activity
set 1 disabled=no interface=ether2 leds=led2 type=interface-activity
set 2 disabled=no interface=ether3 leds=led3 type=interface-activity
set 3 disabled=no interface=ether4 leds=led4 type=interface-activity
set 4 disabled=no interface=ether5 leds=led5 type=interface-activity
set 5 disabled=no interface=wlan1 leds=wlan-led type=wireless-status
/system leds settings
set all-leds-off=never
/system logging
set 0 action=disk disabled=no prefix="" topics=info
set 1 action=disk disabled=no prefix="" topics=error
set 2 action=disk disabled=no prefix="" topics=warning
set 3 action=disk disabled=no prefix="" topics=critical
/system note
set note="" show-at-login=yes
/system ntp client
set enabled=no primary-ntp=0.0.0.0 secondary-ntp=0.0.0.0 server-dns-names=""
/system resource irq
set 0 cpu=auto
set 1 cpu=auto
set 2 cpu=auto
set 3 cpu=auto
set 4 cpu=auto
/system routerboard settings
# Firmware upgraded successfully, please reboot for changes to take effect!
set auto-upgrade=no boot-device=nand-if-fail-then-ethernet boot-protocol=\
    bootp force-backup-booter=no protected-routerboot=disabled \
    reformat-hold-button=20s reformat-hold-button-max=10m silent-boot=no
/system routerboard reset-button
set enabled=no hold-time=0s..1m on-event=""
/system upgrade mirror
set check-interval=1d enabled=no primary-server=0.0.0.0 secondary-server=\
    0.0.0.0 user=""
/system watchdog
set auto-send-supout=no automatic-supout=no ping-start-after-boot=5m \
    ping-timeout=1m watch-address=none watchdog-timer=no
/tool bandwidth-server
set allocate-udp-ports-from=2000 authenticate=yes enabled=yes max-sessions=\
    100
/tool e-mail
set address=0.0.0.0 from=<> password="" port=25 start-tls=no user=""
/tool graphing
set page-refresh=300 store-every=5min
/tool mac-server
set allowed-interface-list=mactel
/tool mac-server mac-winbox
set allowed-interface-list=mac-winbox
/tool mac-server ping
set enabled=yes
/tool romon
set enabled=no id=00:00:00:00:00:00 secrets=""
/tool romon port
set [ find default=yes ] cost=100 disabled=no forbid=no interface=all \
    secrets=""
/tool sms
set allowed-number="" auto-erase=no channel=0 port=none receive-enabled=no \
    secret="" sim-pin=""
/tool sniffer
set file-limit=1000KiB file-name="" filter-cpu="" filter-direction=any \
    filter-interface="" filter-ip-address="" filter-ip-protocol="" \
    filter-ipv6-address="" filter-mac-address="" filter-mac-protocol="" \
    filter-operator-between-entries=or filter-port="" filter-size="" \
    filter-stream=no memory-limit=100KiB memory-scroll=yes only-headers=no \
    streaming-enabled=no streaming-server=0.0.0.0:37008
/tool traffic-generator
set latency-distribution-max=100us measure-out-of-order=yes \
    stats-samples-to-keep=100 test-id=0
/user aaa
set accounting=yes default-group=read exclude-groups="" interim-update=0s \
    use-radius=no

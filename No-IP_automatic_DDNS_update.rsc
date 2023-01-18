# No-IP automatic Dynamic DNS update

:local noipuser "usuario-noip"
:local noippass "contraseña-noip"
:local noiphost "host-noip"
:local inetinterface "pppoe-out1"
# aquí metes tu interfaz WAN que conecta a internet, en mi caso "pppoe-out1"

:global previousIP

:if ([/interface get $inetinterface value-name=running]) do={
:local currentIP [/ip address get [find interface="$inetinterface" disabled=no] address]
:for i from=( [:len $currentIP] - 1) to=0 do={
:if ( [:pick $currentIP $i] = "/") do={
:set currentIP [:pick $currentIP 0 $i]
}
}

:if ($currentIP != $previousIP) do={
:log info "No-IP: la IP actual $currentIP es distinta a la IP anterior, se necesita actualización"
:set previousIP $currentIP

:local url "http://dynupdate.no-ip.com/nic/update\3Fmyip=$currentIP"
:local noiphostarray
:set noiphostarray [:toarray $noiphost]
:foreach host in=$noiphostarray do={
:log info "No-IP: Enviando actualizacion de $host"
/tool fetch url=($url . "&hostname=$host") user=$noipuser password=$noippass mode=http dst-path=("no-ip_ddns_update-" . $host . ".txt")
:log info "No-IP: Es necesario actualizar. la dirección $host se actualizará con la IP $currentIP"
}
} else={
:log info "No-IP: La IP anterior $previousIP es igual a la IP actual, no es necesario actualizar"
}
} else={
:log info "No-IP: El interface $inetinterface en este momento no está operativo, no ha sido posible actualizar"
}
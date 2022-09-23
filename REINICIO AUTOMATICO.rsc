/system scheduler
add interval=1d name="Reiniciar 5 AM" on-event="/system reboot" policy=\
    reboot,read,write,policy,test,password,sniff,sensitive start-date=\
    jan/01/1970 start-time=05:00:00
/system clock
set time-zone-name=America/Montevideo

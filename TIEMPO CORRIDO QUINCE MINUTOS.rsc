{
:local tdias 0
:local tmin 15
:local atime [ /system clock get time ]
:local adate [ /system clock get date ]
:local temp1 [:pick $adate 0 3] 
:local temp2 [:pick $adate 4 6]
:local temp3 [:pick $atime 0 8]
:local temp4 ($temp2."/".$temp1." - ".$temp3);
:local thoras 1
:if ([ /ip hotspot user get $user comment ]="") do={ [ /ip hotspot user set $user comment=$temp4 ] }

# Agrego un registro en el LOG del usuario

:local mesarray ("jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec")
:local diaarray ("31","28","31","30","31","30","31","31","30","31","30","31")
:local day [:pick $adate 4 6]
:local monthtxt [:pick $adate 0 3]
:local year [:pick $adate 7 11]
:local months ([:find $mesarray $monthtxt])
:local dia ([:pick $diaarray $months])
:local fhora [:pick $atime 0 2]
:local fminutos [:pick $atime 3 5]
:local fsegundos [:pick $atime 6 9]
:local mayorhora (($fhora+$thoras)-24) 
:local mayormin (60-($fminutos+$tmin)) 
:local temp5 ($fhora." - ".$fminutos." - ".$tmin." - ".$mayormin."---".$temp4);

if (($fminutos+$tmin)>59) do={
 :set mayormin (($fminutos+$tmin)-60)  
  :if ($mayormin>9) do={
  
   :if (($fhora+$thoras)>24) do={
 
       :set atime ("0".$mayorhora.":".$mayormin.":".fsegundos);

	 :set $tdias ($tdias+1);
     } else={

      :set atime (($fhora+$thoras).":".$mayormin.":".fsegundos) ;
    }

  } else={

    :if (($fhora+$thoras)>24) do={
 
        :set atime ("0".$mayorhora.":0".$mayormin.":".fsegundos);

	 :set $tdias ($tdias+1);
     } else={

          : set atime (($fhora+$thoras).":0".$mayormin.":".fsegundos);
    }
         }
  } else={
     :set atime (($fhora).":".($fminutos+$tmin).":".fsegundos) ;
 }

 :if (($fhora+$thoras)>23) do={

     :set atime ("0".$mayorhora.":".$fminutos.":".fsegundos);

	 :set $tdias ($tdias+1);

	} else={

     :set atime (($fhora).":".($fminutos+$tmin).":".fsegundos) ;
 }

 :if (($day+$tdias)>$dia) do={
    :if ($months=11) do={
        
     :set months 0;
        
     :set year ($year+1);
        
     :set day (($day+$tdias)-$dia);
        
     :local mes ([:pick $mesarray $months]);
        
     :set adate ($mes."/".$day."/".$year);
        
     } else={
           
       :set months ($months+1);
           
       :set day (($day+$tdias)-$dia);
           
       :local mes ([:pick $mesarray $months]);
           
       :set adate ($mes."/".$day."/".$year);
        
       }
    
        } else={
        
          :set day ($day+$tdias);
        
          :local mes ([:pick $mesarray $months]);
        
          :set adate ($mes."/".$day."/".$year);
    
     }

[/system scheduler add name=$user on-event="/ip hotspot user remove [find name=$user] \r\
 \n/ip hotspot active remove [find user=$user] \r\
  \n/system scheduler remove [find name=$user] \r\
  \n/system scheduler remove [find name=Finder:$user] \r\
   \n/\r\
" start-date=$adate start-time=$atime

/s sch
a i=10s n="Finder:$user" on-e=":local atime [ /s cl g time ]\r\
    \n:local J [/s cl g date]\r\
    \n:local o [ :pick \$J 4 6 ]\r\
    \n:local s [ :pick \$J 0 3 ]\r\
    \n:local e [ :pick \$J 7 11 ]\r\
    \n:local spin \"A las \$atime el \$o/\$s/\$e\"\r\
    \n:global next [/s sch g [f name=\"$user\"] next-run];\r\
    \n:if ([:len \$next] <= 0) do={\r\
    \n      :l w \"Ficha INFINITA Encontrada:$user\"\r\
    \n      :l w \"Removiendo: $user \$spin\"\r\
    \n/ip h u rem [f name=$user] \r\
    \n/ip h ac r [f name=$user] \r\
    \n/s sch r [f name=$user] \r\
    \n/s sch r [f name=Finder:$user] \r\
    \n} else={\r\
    \n    :l w \"Ficha:$user Vigente\"\r\
    \n/\r\
    \n}" start-d=$adate start-t=($atime + 00:00:10)]
   } 



  
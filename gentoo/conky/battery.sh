#!/bin/sh
#:: battery script by crimeboy
#:: 11jan07
#:: v4 gpl
#::::::::::::::::::::::::::::.::...:...... ..   .

restobat=10 # battery percentage to trigger the alarm
battmp3z=/usr/share/sounds/bateria.mp3 # alarm
# funcao
batprocc=/proc/acpi/battery
battunit=$(ls $batprocc | sed -n 1p)
fullbatt=$(cat $batprocc/$battunit/info | grep full | awk '{ print $4 }')
indexxxx=$(cat $batprocc/$battunit/state | grep mAh | awk '{ print $3 }')
if [ $(($indexxxx/($fullbatt/100))) -lt $restobat ]; then
play $battmp3z
fi
echo $(($indexxxx/($fullbatt/100)))

#!/bin/sh
wrapper=yay
$wrapper -Syy >/dev/null 2>&1
update=$($wrapper -Qu | wc -l)
#echo $update
#nmcli dev wifi | grep "\*" > /dev/null 2>&1
iface_up=$(iwconfig wlp1s0 | grep ESSID | cut -d":" -f2 | cut -d"/" -f1)
#?
connect=$(fping arch.yourlabs.org | awk '{print $3}')

if [ $connect == "alive" ]; then
#if [ ${iface_up} = "off" ]; then 
	if [ ${update} = "0" ]; then
		echo "0"
	else
		echo ${update}
	fi
else
		echo ""
fi

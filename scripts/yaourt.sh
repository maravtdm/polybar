#!/bin/sh
iface_up=$(iwconfig wlp1s0 | grep ESSID | cut -d":" -f2 | cut -d"/" -f1)
#?
if [ ${iface_up} = "off" ]; then 
	wrapper=yay
	$wrapper -Syy >/dev/null 2>&1
	update=$($wrapper -Qu | wc -l)
	if [ ${update} = "0" ]; then
		echo "0"
	else
		echo ${update}
	fi
else
		echo ""
fi

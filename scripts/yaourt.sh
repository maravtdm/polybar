#!/bin/sh

iface_up=$(iwconfig wlp1s0 | awk -F":" '/ESSID/ {print $2}' | cut -d"/" -f1)

if [[ ${iface_up} != "off" ]]; then 
	fping -c1 1.1.1.1 >/dev/null 2>&1
	connect=$?
	if [[ ${connect} == "1" ]]; then
		echo ""
	else
		wrapper=yay
		${wrapper} -Syy >/dev/null 2>&1
		update=$($wrapper -Qu | wc -l)
		if [[ ${update} = "0" ]]; then
			echo "0"
		else
			echo ${update}
		fi
	fi
else
		echo ""
fi

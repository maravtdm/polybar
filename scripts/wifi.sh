#!/usr/bin/env bash
state=$(iwconfig wlp1s0 | grep ESSID | cut -d":" -f2 | cut -d"/" -f1)
essid=$(iw dev wlp1s0 info | awk '/ssid/ {print $2}')
addr_ip=$(ifconfig wlp1s0 | awk '/inet / {print $2}')
label_deconnected=" "

case $state in
off)
	echo "$label_deconnected"
	;;
*)
	echo "$essid"
	;;
esac

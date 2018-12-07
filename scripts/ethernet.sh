#!/bin/bash
label=" "
label_down=" "
ifconfig enp0s20f0u1u2 >/dev/null 2>&1
DEVICE="$?"
if [[ $DEVICE = "0" ]]; then
	interface=enp0s20f0u1u2
	speed=$(sudo ethtool enp0s20f0u1u2 | grep Speed | cut -d":" -f2)
	nmcli connection show --active | grep ${interface} >/dev/null 2>&1
	IF_UP="$?"
	ipaddr=$(ifconfig enp0s20f0u1u2 | grep "inet " | awk '{ print $2}')
	if [[ $IF_UP = "0" ]]; then 
		echo -n $speed
	fi
else
	echo -en $label_down 
fi

#!/bin/sh
label_prefix=""
label_umount=""
for dev in '807A-F083'
do
	mount | grep /run/media/david/$dev >/dev/null 2>&1
	mount=$?
	if [ "$mount" == "0" ]; then
		echo -n "dell"
	else
		echo -n ""
		#"$label_umount"
	fi
done

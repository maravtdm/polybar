#!/bin/sh
label_prefix=""
label_umount=""
#for dev in 'doc' 'ssh' 'yang'
for dev in 'doc' 'yang'
do
	mount | grep /mnt/$dev >/dev/null 2>&1
	mount=$?
	if [ "$mount" == "0" ]; then
		echo -n "  "$dev""
	else
		echo -n "  $label_umount"
	fi
done

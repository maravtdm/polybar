#!/bin/sh
kernel=$(uname -r | sed 's/-ARCH//')
label=" "
stable=$(w3m -dump "www.kernel.org" | grep stable | head -1 | awk '{print $2}')

#t=0
#toggle() {
#    t=$(((t + 1) % 2))
#}
#trap "toggle" USR1
#while true; do
#    if [ $t -eq 0 ]; then
#	echo -n $kernel - Stable : `
#    else
#	echo -n $kernel
#    fi
#    sleep 1 &
#    wait
#done

t=0

toggle() {
    t=$(((t + 1) % 2))
}


trap "toggle" USR1

while true; do
    if [ $t -eq 0 ]; then
        echo $kernel 
    else
        echo Current : $stable
    fi
    sleep 1 &
    wait
done

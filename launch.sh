#!/usr/bin/env sh
set -x
# Terminate already running bar instances
for i in polybar; do sudo pkill $i; done
for i in pactl; do sudo pkill $i; done

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null
	do sleep 2
done

edp=$(xrandr | awk '/eDP/ {print $1}')
hdmi=$(xrandr | awk '/HDMI/ {print $1}')
mega_pid=$(pgrep mega)
status=$(xrandr -q | grep ${hdmi} | awk '{print $2}')

if [[ ! -z ${mega_pid} ]]; then
	kill ${mega_pid}
fi

if [ "$status" == "connected" ]; then
	m=${hdmi}
	MONITOR=$m polybar --reload top &
#	MONITOR=$m polybar -l info --reload top > $HOME/.config/polybar/top.log 2>&1 &
else
	m=${edp}
	MONITOR=$m polybar --reload top &
#	MONITOR=$m polybar -l info --reload top > $HOME/.config/polybar/top.log 2>&1 &
fi
megasync &

#!/bin/bash
while true; do
	lightval=`cat /sys/bus/acpi/devices/ACPI0008:00/ali`

	if [[ "$lightval" -gt 4000 ]]; then
		for wind in `xdotool search --class "urxvt"`; do
			xdotool key --window $wind F11
		done

	else
	    for wind in `xdotool search --class "urxvt"`; do
			xdotool key --window $wind F12
		done

	fi
	sleep 5
done


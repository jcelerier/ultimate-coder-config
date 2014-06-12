#!/bin/sh
setxkbmap fr latin9 &
export TERMINAL=urxvtc

i3&

while true; do
	find ~/backgrounds/ -type f \( -name '*.jpg' -o -name '*.png' \) -print0 |
		shuf -n1 -z | xargs -0 feh --bg-fill
	sleep 15m
done


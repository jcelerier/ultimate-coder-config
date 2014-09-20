#!/bin/bash -x

i3-msg '[instance="nextURxvt"] move workspace current'
WINDOW_ID=`xwininfo -tree -root|grep nextURxvt|awk '{print $1;}'`
xprop -id $WINDOW_ID -f WM_CLASS 8ss -set WM_CLASS "urxvt"
i3-msg 'exec urxvtc -name nextURxvt'

#!/bin/sh
slstatus &
xrandr --output Virtual1 --mode 1920x1200
nitrogen --restore &
exec dwm

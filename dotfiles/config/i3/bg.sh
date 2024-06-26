#!/bin/sh

while true; do
	find $HOME/.local/share/wallpapers -type f \( -name '*.jpg' -o -name '*.png' \) -print0 |
		shuf -n1 -z | xargs -0 feh --bg-scale
	sleep 15m
done

#!/bin/bash
WALLPAPER_DIR=~/Pictures/wallpapers
INTERVAL=900

while true; do
  feh --randomize --bg-fill $WALLPAPER_DIR/*
  sleep $INTERVAL
done

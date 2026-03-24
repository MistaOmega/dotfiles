#!/bin/bash
sleep 5
export $(systemctl --user show-environment | xargs)
exec linux-wallpaperengine --screen-root DP-3 --screen-root DP-2 1959836574 --silent --fps 30

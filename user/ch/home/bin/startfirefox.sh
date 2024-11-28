#!/usr/bin/env bash
firefox &
while ! hyprctl clients | grep -q "Firefox"; do
	sleep 0.2
done
hyprctl dispatch movetoworkspacesilent 2,firefox
sleep 0.2
hyprctl dispatch workspace 1

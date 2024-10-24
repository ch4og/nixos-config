#!/usr/bin/env bash
zen &
while ! hyprctl clients | grep -q "Zen Browser"; do
	sleep 0.2
done
hyprctl dispatch movetoworkspacesilent 7,zen
sleep 0.2
hyprctl dispatch workspace 6

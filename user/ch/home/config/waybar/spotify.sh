#!/usr/bin/env bash

status=$(playerctl -p spotify status 2>/dev/null)

title=$(playerctl -p spotify metadata title 2>/dev/null)

artist=$(playerctl -p spotify metadata artist 2>/dev/null)

if [[ "$status" == "Playing" ]]; then
	text="$artist - $title"
	alt="playing"
elif [[ "$status" == "Paused" ]]; then
	text="$artist - $title"
	alt="paused"
else
	text=""
	alt="stopped"
fi

output=$(jq -n --unbuffered --compact-output \
	--arg alt "$alt" \
	--arg text "$text" \
	'{text: $text, alt: $alt}')
echo "$output"

#!/usr/bin/env bash

ncount=$(echo $(swaync-client -c))
dnd=$(echo $(swaync-client -D))

if [[ $dnd == "true" ]]; then
	status="dnd"
elif [[ $ncount -gt 0 ]]; then
	status="new"
else
	status="none"
fi

output=$(jq -n --unbuffered --compact-output \
	--arg alt "$status" \
	'{alt: $alt}')
echo "$output"

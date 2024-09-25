#!/usr/bin/env bash
task=$1
if [[ "$task" == "--toggle" ]]; then
	# Toggle VPN
	vpn=$2
	vpn_status=$(nmcli connection show "$vpn" | grep -q "activated" && echo "on" || echo "off")
	if [[ "$vpn_status" == "on" ]]; then
		nmcli connection down "$vpn"
	else
		nmcli connection up "$vpn"
	fi
	exit
fi

if [[ "$task" == "--status" ]]; then
	vpn=$2
	wifi_details=$(nmcli -t -f active,ssid,signal dev wifi)
	wifi_status=$(echo "$wifi_details" | grep -q '^yes' && echo 'on' || echo 'off')
	vpn_status=$(nmcli connection show "$vpn" | grep -q "activated" && echo "on" || echo "off")

	if [[ "$wifi_status" == "on" && "$vpn_status" == "off" ]]; then
		alt="wifi"
		tooltip=$(echo "$wifi_details" | grep '^yes' | cut -d: -f2,3 | awk -F: '{print $1 " (" $2 "%)"}')
	elif [[ "$wifi_status" == "on" && "$vpn_status" == "on" ]]; then
		alt="vpn"
		tooltip=$vpn
	else
		alt="off"
		tooltip="No wifi connection"
	fi

	output=$(jq -n --unbuffered --compact-output \
		--arg alt "$alt" \
		--arg tooltip "$tooltip" \
		'{tooltip: $tooltip, alt: $alt}')
	echo "$output"
fi

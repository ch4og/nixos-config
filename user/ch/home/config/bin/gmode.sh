#!/usr/bin/env sh
modprobe acpi_call

if [[ "$1" == "" ]]; then
		echo '\_SB.PCI0.LPC0.EC0._Q14' > /proc/acpi/call 
		echo '\_SB.AMW3.WMAX 0 0x25 { 1, 0, 0, 0}' > /proc/acpi/call 
fi

echo '\\_SB.AMW3.WMAX 0 0x25 { 2, 0, 0, 0}' > /proc/acpi/call 
GMODE=$(/usr/bin/env cat /proc/acpi/call | tr -d '\0')
if [[ "$GMODE" == "0x0" ]]; then
	echo "1"
else
	echo "0"
fi
exit 0


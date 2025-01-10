#!/run/current-system/sw/bin/bash
set -x

# Stop display manager
systemctl stop display-manager
# systemctl --user -M YOUR_USERNAME@ stop plasma*

# Unbind VTconsoles: might not be needed
echo 0 >/sys/class/vtconsole/vtcon0/bind
echo 0 >/sys/class/vtconsole/vtcon1/bind

# Unbind EFI Framebuffer
# echo efi-framebuffer.0 >/sys/bus/platform/drivers/efi-framebuffer/unbind
sleep 7

# Unload NVIDIA kernel modules
modprobe -r nvidia_uvm
sleep 2 && modprobe -r nvidia_drm
modprobe -r nvidia_modeset
modprobe -r nvidia

# Unload AMD kernel module
# modprobe -r amdgpu

# Detach GPU devices from host
# Use your GPU and HDMI Audio PCI host device
virsh nodedev-detach pci_0000_01_00_0
virsh nodedev-detach pci_0000_01_00_1

# Load vfio module
modprobe vfio-pci

# Limit CPUs for host
systemctl set-property --runtime -- user.slice AllowedCPUs=0-1
systemctl set-property --runtime -- system.slice AllowedCPUs=0-1
systemctl set-property --runtime -- init.scope AllowedCPUs=0-1

# Turn off proxy
systemctl stop sing-box.service

# Huge Pages (WIP)
# HUGEPAGES="$((12288 / $(($(grep Hugepagesize /proc/meminfo | awk '{print $2}') / 1024))))"
# echo "Allocating hugepages..."
# echo $HUGEPAGES >/proc/sys/vm/nr_hugepages
# ALLOC_PAGES=$(cat /proc/sys/vm/nr_hugepages)
#
# TRIES=0
# while ((ALLOC_PAGES != HUGEPAGES && TRIES < 1000)); do
# 	echo 1 >/proc/sys/vm/compact_memory ## defrag ram
# 	echo $HUGEPAGES >/proc/sys/vm/nr_hugepages
# 	ALLOC_PAGES=$(cat /proc/sys/vm/nr_hugepages)
# 	echo "Succesfully allocated $ALLOC_PAGES / $HUGEPAGES"
# 	((TRIES += 1))
# done
#
# if [ "$ALLOC_PAGES" -ne "$HUGEPAGES" ]; then
# 	echo "Not able to allocate all hugepages. Reverting..."
# 	echo 0 >/proc/sys/vm/nr_hugepages
# 	exit 1
# fi

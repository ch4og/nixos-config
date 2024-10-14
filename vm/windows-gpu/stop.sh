#!/run/current-system/sw/bin/bash
set -x

# Return CPUs to host
systemctl set-property --runtime -- user.slice AllowedCPUs=0-15
systemctl set-property --runtime -- system.slice AllowedCPUs=0-15
systemctl set-property --runtime -- init.scope AllowedCPUs=0-15

# Attach GPU devices to host
# Use your GPU and HDMI Audio PCI host device
virsh nodedev-reattach pci_0000_01_00_0
virsh nodedev-reattach pci_0000_01_00_1

# Unload vfio module
modprobe -r vfio-pci

# Load AMD kernel module
#modprobe amdgpu

# Rebind framebuffer to host
echo "efi-framebuffer.0" >/sys/bus/platform/drivers/efi-framebuffer/bind

# Load NVIDIA kernel modules
modprobe nvidia_drm
modprobe nvidia_modeset
modprobe nvidia_uvm
modprobe nvidia

# Bind VTconsoles: might not be needed
echo 1 >/sys/class/vtconsole/vtcon0/bind
echo 1 >/sys/class/vtconsole/vtcon1/bind

# Restart Display Manager
systemctl start display-manager

# Deallocate huge pages (WIP)
# echo 0 >/proc/sys/vm/nr_hugepages
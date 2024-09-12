{ nixvirt, ... }: {
  # virtualisation.libvirt = {
  #   swtpm.enable = true;
  #   connections."qemu:///session".domains = [
  #     {
  #       definition = nixvirt.lib.domain.writeXML (nixvirt.lib.domain.templates.windows
  #         {
  #           name = "winvm";
  #           uuid = "4c7fdc84-fd95-4515-9fbd-9640913411cc";
  #           memory = { count = 8; unit = "GiB"; };
  #           storage_vol = /home/ch/VMs/Windows/Windows.qcow2;
  #           install_vol = /home/ch/VMs/Windows/Windows.iso;
  #           nvram_path = /home/ch/VMs/Windows/Windows.nvram;
  #           virtio_net = true;
  #           virtio_drive = true;
  #           install_virtio = true;
  #         });
  #     }
  #   ];
  # };
}

{ config, lib, pkgs, ... }: {
  imports = [
    ./system
    ./user/ch
  ];
  services = {
    openssh.enable = true;
    resolved = {
      enable = true;
    };
    blueman.enable = true;
    xserver = {
      # enable = true;
      videoDrivers = [ "nvidia" ];
    };
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    usbmuxd.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      publish = {
        enable = true;
        userServices = true;
        addresses = true;
      };
    };
  };

  networking = {
    hostName = "nixpc";
    networkmanager.enable = true;
    firewall.enable = false;
  };
  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [ "compress=zstd" "noatime" ];
    "/var/log".options = [ "compress=zstd" ];
    "/home/ch/Games".options = [ "compress=zstd" ];
  };
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" ];
  };
  zramSwap.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = [ pkgs.nvidia-vaapi-driver ];
  };
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    open = true;
    nvidiaSettings = true;
    prime = {
      nvidiaBusId = "PCI:1:0:0";
      amdgpuBusId = "PCI:6:0:0";
      # sync.enable = true;
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      ovmf.packages = with pkgs; [ OVMFFull.fd ];
      vhostUserPackages = [ pkgs.virtiofsd ];
    };
  };
}

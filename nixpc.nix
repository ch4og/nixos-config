{ config, lib, pkgs, ... }: {
  imports = [
    ./system
    ./user/ch
    ./vm/windows-gpu
  ];
  services = {
    openssh.enable = true;
    resolved = {
      enable = true;
      extraConfig = ''
        DNS=45.90.28.0#7f4f42.dns.nextdns.io
        DNS=2a07:a8c0::#7f4f42.dns.nextdns.io
        DNS=45.90.30.0#7f4f42.dns.nextdns.io
        DNS=2a07:a8c1::#7f4f42.dns.nextdns.io
        DNSOverTLS=yes
      '';
    };
    blueman.enable = true;
    xserver.videoDrivers = [ "nvidia" ];
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
    btrfs.autoScrub = {
      enable = true;
      interval = "monthly";
      fileSystems = [ "/" ];
    };
    fstrim.enable = true;
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
    # powerManagement.finegrained = true;
    open = false;
    nvidiaSettings = true;
    # prime = {
    #   nvidiaBusId = "PCI:1:0:0";
    #   amdgpuBusId = "PCI:6:0:0";
    #   sync.enable = true;
    # };
  };
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    libvirtd = {
      enable = true;
      onBoot = "ignore";
      onShutdown = "shutdown";
      qemu = {
        ovmf = {
          enable = true;
          packages = with pkgs; [ OVMFFull.fd ];
        };
        runAsRoot = true;
      };
    };
  };
  boot = {
    kernelModules = [
      "vfio-pci"
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];
    kernelParams = [
      "amd_iommu=on"
      "iommu=pt"
      "nvidia.NVreg_UsePageAttributeTable=1"
    ];
  };
}

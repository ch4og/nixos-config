{ self, inputs, config, lib, pkgs, ... }:
let
  nextdns = builtins.extraBuiltins.readSops ./nextdns.nix.enc;
in
{
  imports = [
    ./system
    ./user/ch
    ./vm/windows-gpu
    (import ./proxy { inherit config nextdns; })

    inputs.sops-nix.nixosModules.sops
  ];
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/ch/.config/sops/age/keys.txt";
  };

  services = {
    openssh.enable = true;
    resolved = {
      enable = false;
      extraConfig = ''
        DNS=45.90.28.0#${nextdns}.dns.nextdns.io
        DNS=2a07:a8c0::#${nextdns}.dns.nextdns.io
        DNS=45.90.30.0#${nextdns}.dns.nextdns.io
        DNS=2a07:a8c1::#${nextdns}.dns.nextdns.io
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
    "/home" = {
      neededForBoot = true; # fix https://github.com/Mic92/sops-nix/issues/149
      options = [ "compress=zstd" ];
    };
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

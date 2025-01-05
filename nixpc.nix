{
  self,
  inputs,
  config,
  lib,
  pkgs,
  ...
}: let
  nextdns = builtins.extraBuiltins.readSops ./nextdns.nix.enc;
  vless = builtins.extraBuiltins.readSops ./vless.nix.enc;
in {
  imports = [
    ./system
    ./user/ch
    ./vm/windows-gpu
    (import ./proxy {inherit config pkgs nextdns vless;})
  ];

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
    xserver.videoDrivers = ["nvidia"];
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      extraPackages = [pkgs.sddm-chili-theme];
      theme = "chili";
      settings = {
        Autologin = {
          Session = "hyprland.desktop";
          User = "ch";
        };
      };
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
      interval = "weekly";
      fileSystems = ["/"];
    };
    fstrim.enable = true;
  };

  networking = {
    hostName = "nixpc";
    extraHosts = ''
      10.42.0.253 winpc.local
    '';
    networkmanager.enable = true;
    firewall.enable = false;
  };
  fileSystems = {
    "/".options = ["compress=zstd"];
    "/home" = {
      neededForBoot = true; # fix https://github.com/Mic92/sops-nix/issues/149
      options = ["compress=zstd"];
    };
    "/nix".options = [
      "compress=zstd"
      "noatime"
    ];
    "/var/log".options = ["compress=zstd"];
    "/home/ch/Games".options = ["compress=zstd"];
  };
  zramSwap.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = [pkgs.nvidia-vaapi-driver];
  };
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
  };
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = false;
      defaultNetwork.settings.dns_enabled = true;
    };
    docker = {
      enable = true;
      autoPrune.enable = true;
    };
    libvirtd = {
      enable = true;
      onBoot = "ignore";
      onShutdown = "shutdown";
      qemu = {
        ovmf = {
          enable = true;
          packages = with pkgs; [OVMFFull.fd];
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

{
  self,
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./system
    ./user/ch
    inputs.nix-gaming.nixosModules.pipewireLowLatency
    inputs.nix-gaming.nixosModules.platformOptimizations
  ];

  services = {
    openssh.enable = true;
    blueman.enable = true;
    xserver.videoDrivers = ["nvidia"];
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      settings = {
        Autologin = {
          User = "ch";
          Session = "hyprland-uwsm.desktop";
        };
      };
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      #lowLatency.enable = true; # causes crackling when cpu is under load
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
  programs.hyprland = {
    package = pkgs.hyprland-git.hyprland;
    withUWSM = true;
  };
  networking = {
    hostName = "nixpc";
    networkmanager.enable = true;
    firewall.enable = false;
  };
  fileSystems = {
    "/".options = ["compress=zstd"];
    "/home" = {
      neededForBoot = true;
      options = ["compress=zstd"];
    };
    "/nix".options = [
      "compress=zstd"
      "noatime"
    ];
    "/var/log".options = ["compress=zstd"];
    "/home/ch/Games".options = ["compress=zstd"];
    "/home/ch/Windows" = {
      device = "/dev/disk/by-uuid/8A18903F18902C67";
      fsType = "ntfs-3g";
      options = ["rw" "uid=1000"];
    };
  };
  zramSwap = {
    enable = true;
    memoryPercent = 25;
  };
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = [pkgs.nvidia-vaapi-driver];
    };
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      open = true;
      nvidiaSettings = true;
    };
  };
  virtualisation = {
    docker = {
      enable = true;
      autoPrune.enable = true;
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
    supportedFilesystems = ["ntfs"];
  };
}

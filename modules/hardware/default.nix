{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./btrfs-snapshots.nix
  ];

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = [
        pkgs.nvidia-vaapi-driver
      ];
    };

    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = false;
      };
      open = true;
      nvidiaSettings = true;
    };
    opentabletdriver.enable = true;
  };

  swapDevices = [
    {
      device = "/swap/swapfile";
      size = 16 * 1024;
    }
  ];

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
    memoryPercent = 25; # 25%
  };

  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = ["/" "/home" "/nix" "/var/log" "/home/ch/Games"];
  };

  services.fstrim.enable = true;

  virtualisation = {
    docker = {
      enable = true;
      autoPrune.enable = true;
    };
    spiceUSBRedirection.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [pkgs.OVMF.fd];
        };
      };
    };
  };
}

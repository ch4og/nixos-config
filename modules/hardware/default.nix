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
      package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
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
    fileSystems = ["/"];
  };

  services.fstrim.enable = true;

  virtualisation = {
    docker = {
      enable = true;
      autoPrune.enable = true;
    };
  };
}

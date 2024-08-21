{ config, lib, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];
  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [ "compress=zstd" "noatime" ];
    "/swap".options = [ "noatime" ];
    "/var/log".options = [ "compress=zstd" ];
  };
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" ];
  };
  swapDevices = [{ device = "/swap/swapfile"; }];
}

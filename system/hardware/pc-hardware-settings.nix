{ config, lib, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];
  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [ "compress=zstd" "noatime" ];
    "/var/log".options = [ "compress=zstd" ];
  };
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" ];
  };
	hardware.opengl.enable = true;
	hardware.nvidia = {
		package = config.boot.kernelPackages.nvidiaPackages.stable;

		modesetting.enable = true;
		powerManagement.enable = true;
		powerManagement.finegrained = false;
		open = true;
		nvidiaSettings = true;
	};


}

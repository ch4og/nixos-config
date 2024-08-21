{ config, lib, pkgs, ... }: {
  imports = [
    ./system/boot.nix
    ./system/defaults.nix
    ./system/hardware/vm-hardware-settings.nix
    ./system/services/vm-services.nix

    ./user/ch
  ];
  environment.systemPackages = import ./system/pkgs.nix { inherit pkgs; };

  networking = {
    hostName = "nixvm";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  virtualisation.hypervGuest.videoMode = "1920x1080";
}

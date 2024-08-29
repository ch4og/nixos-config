{ config, lib, pkgs, ... }: {
  imports = [
    ./system/boot.nix
    ./system/defaults.nix
    ./system/hardware/pc-hardware-settings.nix
    ./system/services/pc-services.nix

    ./user/ch
  ];
  environment.systemPackages = import ./system/pkgs.nix { inherit pkgs; };

  networking = {
    hostName = "nixpc";
    networkmanager.enable = true;
    firewall.enable = false;
  };

}

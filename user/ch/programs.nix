{ config, lib, pkgs, inputs, ... }: {
  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };
  programs.hyprland = {
    enable = true;
    portalPackage = pkgs.master.xdg-desktop-portal-hyprland;
  };
  programs.thunar.enable = true;
  services.tumbler.enable = true;
  services.gvfs.enable = true;
  services.flatpak.enable = true;
}

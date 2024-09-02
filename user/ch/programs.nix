{ config, lib, pkgs, inputs, ... }: {
  programs.anime-game-launcher.enable = true;
  programs.steam.enable = true;
  programs.hyprland = {
    enable = true;
    portalPackage = pkgs.master.xdg-desktop-portal-hyprland;
  };
  programs.thunar.enable = true;
  services.tumbler.enable = true;
  services.gvfs.enable = true;
}

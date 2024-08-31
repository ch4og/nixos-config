{ config, lib, pkgs, inputs, ... }: {
  programs.anime-game-launcher.enable = true;
  programs.steam.enable = true;
  programs.hyprland.enable = true;
  programs.thunar.enable = true;
}

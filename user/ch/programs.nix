{ config, lib, pkgs, inputs, ... }: {
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };
  programs.hyprland.enable = true;
  programs.thunar.enable = true;
  services.tumbler.enable = true;
  services.gvfs.enable = true;
  # services.flatpak.enable = true;
  programs.virt-manager.enable = true;

  imports = [ inputs.aagl.nixosModules.default ];
  programs.anime-game-launcher.enable = true;
  hardware.opentabletdriver.enable = true;
}

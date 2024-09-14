{ config, lib, pkgs, inputs, ... }: {
  programs.steam = {
    enable = true;
    extraCompatPackages = [ inputs.master.legacyPackages.x86_64-linux.proton-ge-bin ];
  };
  programs.hyprland = { enable = true; };
  programs.thunar.enable = true;
  services.tumbler.enable = true;
  services.gvfs.enable = true;
  services.flatpak.enable = true;
  programs.virt-manager.enable = true;
}

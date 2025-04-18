{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.aagl.nixosModules.default];
  programs = {
    steam = {
      enable = true;
      extraCompatPackages = with pkgs; [proton-ge-custom];
    };
    hyprland.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-volman
        thunar-archive-plugin
        thunar-media-tags-plugin
      ];
    };
    anime-game-launcher.enable = true;
    honkers-railway-launcher.enable = true;
    dconf.enable = true;
  };
  services = {
    tumbler.enable = true;
    gvfs.enable = true;
  };
  hardware.opentabletdriver.enable = true;
}

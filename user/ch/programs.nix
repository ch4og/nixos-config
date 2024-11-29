{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.aagl.nixosModules.default];
  programs = {
    steam = {
      enable = true;
      extraCompatPackages = with pkgs; [proton-ge-bin];
    };
    hyprland.enable = true;
    thunar.enable = true;
    virt-manager.enable = true;
    anime-game-launcher.enable = true;
    honkers-railway-launcher.enable = true;
    dconf.enable = true;
    firefox = {
      enable = true;
      preferences = {
        "gfx.webrender.all" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "widget.dmabuf.force-enabled" = true;
        "privacy.webrtc.legacyGlobalIndicator" = false;
      };
    };
  };
  services = {
    tumbler.enable = true;
    gvfs.enable = true;
    # flatpak.enable = true;
  };
  hardware.opentabletdriver.enable = true;
}

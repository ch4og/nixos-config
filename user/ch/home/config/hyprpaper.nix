{ config, pkgs, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [
        "${config.home.homeDirectory}/Pictures/walls/ui_mama_up.png"
        "${config.home.homeDirectory}/Pictures/walls/wallhaven-gpjv8d-CUT.jpg"
      ];
      wallpaper = [
        "HDMI-A-1,${config.home.homeDirectory}/Pictures/walls/ui_mama_up.png"
        "eDP-1,${config.home.homeDirectory}/Pictures/walls/wallhaven-gpjv8d-CUT.jpg"
      ];
    };
  };

}

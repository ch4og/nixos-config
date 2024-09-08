{ config, pkgs, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [
        "${config.home.homeDirectory}/Pictures/walls/bestwall.jpg"
        "${config.home.homeDirectory}/Pictures/walls/2024-06-11_09-28_1.png"
      ];
      wallpaper = [
        "HDMI-A-1,${config.home.homeDirectory}/Pictures/walls/bestwall.jpg"
        "eDP-1,${config.home.homeDirectory}/Pictures/walls/2024-06-11_09-28_1.png"
      ];
    };
  };

}

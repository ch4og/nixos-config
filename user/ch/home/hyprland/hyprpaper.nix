{ config, pkgs, ... }: {
  services.hyprpaper = {
    enable = true;
    settings =
      let
        main = "wallhaven-gp27r3-up.png";
        secondary = "wallhaven-gpjv8d-CUT.jpg";

        walls = "${config.home.homeDirectory}/Pictures/walls";
      in
      {
        ipc = "on";
        splash = false;
        preload = [
          "${walls}/${main}"
          "${walls}/${secondary}"
        ];
        wallpaper = [
          "HDMI-A-1, ${walls}/${main}"
          "eDP-1, ${walls}/${secondary}"
        ];
      };
  };

}

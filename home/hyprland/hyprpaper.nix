{config, ...}: {
  services.hyprpaper = {
    enable = true;
    settings = let
      main = "wallhaven-expj3o_upscayl_2x_digital-art-4x.png";
      secondary = "wallhaven-exkxw8.jpg";

      walls = "${config.home.homeDirectory}/Pictures/walls";
    in {
      ipc = "on";
      splash = false;
      preload = [
        "${walls}/${main}"
        "${walls}/${secondary}"
      ];
      wallpaper = [
        "DP-1, ${walls}/${main}"
        "HDMI-A-1, ${walls}/${main}"
        "eDP-1, ${walls}/${secondary}"
      ];
    };
  };
}

{config, ...}: {
  services.hyprpaper = {
    enable = true;
    settings = let
      main = "wallhaven-zywljw.png";
      secondary = "wallhaven-v9ojz3.jpg";

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
        "eDP-1, ${walls}/${secondary}"
      ];
    };
  };
}

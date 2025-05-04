{pkgs, ...}: {
  services.hyprpaper = {
    enable = true;
    settings = let
      walls = import ../theme/wallpapers.nix {inherit pkgs;};
    in {
      ipc = "on";
      splash = false;
      preload = [
        "${walls.main}"
        "${walls.secondary}"
      ];
      wallpaper = [
        "DP-1, ${walls.main}"
        "eDP-1, ${walls.secondary}"
      ];
    };
  };
}

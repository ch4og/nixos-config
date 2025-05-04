{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
  };
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

    image = (import ./wallpapers.nix {inherit pkgs;}).main;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    fonts = {
      sizes = {
        desktop = 8;
        applications = 10;
        terminal = 12;
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      monospace = {
        package = pkgs.callPackage ./coco.nix {};
        name = let
          a = "ic";
          b = "";
          c = "m";
          d = " ";
          e = "de";
          f = "";
          g = "C";
          h = "";
          i = "o";
        in
          b + g + i + c + h + a + f + g + b + i + e + d + h + "Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
    targets = {
      firefox.profileNames = ["9rhmal6a.default"];
      mangohud.enable = false;
      yazi.enable = false;
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-dark";
    };
  };
}

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
        name = "ComicCode Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
    targets = {
      firefox.profileNames = ["9rhmal6a.default"];
      mangohud.enable = false;
      waybar.enable = false;
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

{ config, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.6";
      font_family = ''family="ComicCode Nerd Font"'';
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
    };
  };
}

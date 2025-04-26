{
  config,
  pkgs,
  ...
}: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      gtk-titlebar = false;
      theme = "KittyDefault";
      font-family = "ComicCode Nerd Font";
      font-size = "12";
      background-opacity = "0.6";
      adjust-cursor-thickness = "1";
      font-feature = ["-calt" "-liga" "-dlig"];
    };
    themes = {
      KittyDefault = {
        background = "#000000";
        cursor-color = "#cccccc";
        foreground = "#dddddd";
        palette = [
          "0=000000"
          "1=cc0403"
          "2=19cb00"
          "3=cecb00"
          "4=0d73cc"
          "5=cb1ed1"
          "6=0dcdcd"
          "7=dddddd"
          "8=767676"
          "9=f2201f"
          "10=23fd00"
          "11=fffd00"
          "12=1a8fff"
          "13=fd28ff"
          "14=14ffff"
          "15=ffffff"
        ];
        selection-background = "#fffacd";
        selection-foreground = "#000000";
      };
    };
  };
}

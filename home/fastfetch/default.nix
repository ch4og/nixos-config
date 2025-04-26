{config, ...}: let
  allFiles = builtins.attrNames (builtins.readDir ./.);
  images = builtins.filter (name: builtins.match ".*\\.png$" name != null) allFiles;
  mkFileAttr = name: {
    source = "${./.}/${name}";
  };
in {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty";
        source = "${config.xdg.configHome}/fastfetch/nixos_girl.png";
        width = 20;
        height = 8;
        padding = {
          top = 1;
          left = 3;
        };
      };
      modules = [
        {
          type = "custom";
          format = "";
        }
        "title"
        "separator"
        {
          type = "os";
          key = "os";
        }
        {
          type = "kernel";
          key = "kernel";
        }
        {
          type = "uptime";
          key = "up";
        }
        {
          type = "wm";
          key = "wm";
        }
        {
          type = "shell";
          key = "shell";
        }
        {
          type = "terminal";
          format = "{3}";
          key = "term";
        }
        {
          type = "colors";
          symbol = "circle";
        }
      ];
    };
  };
  xdg.configFile = builtins.listToAttrs (
    map (name: {
      name = "fastfetch/${name}";
      value = mkFileAttr name;
    })
    images
  );
}

{ config, pkgs, ... }: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "small";
        padding = { top = 1; };
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
          format = "{5}";
          key = "term";
        }
        {
          type = "colors";
          symbol = "circle";
        }
      ];
    };
  };
}

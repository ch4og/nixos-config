{ config, pkgs, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "hyprland/workspaces" ]; # "custom/spotify"];
        # modules-center = [ "hyprland/window" ];
        modules-right = [
          "tray"
          "pulseaudio"
          "network"
          "battery"
          "hyprland/language"
          "clock"
        ];
        "hyprland/workspaces" = {
          all-outputs = false;
          format = "{icon}";
          format-icons = {
            "1" = " ";
            "2" = " ";
            "6" = " ";
            "7" = " ";
            "urgent" = " ";
            "focused" = " ";
            "default" = " ";
          };
        };
        "hyprland/language" = {
          format = "{}";
          format-en = "🦅";
          format-ru = "🇷🇺";
        };
        tray = {
          # icon-size = 21;
          spacing = 10;
        };
        clock = {
          tooltip-format = "{:%a %d %b %R}";
          format = "{:%H:%M:%S}";
          interval = 1;
        };
        cpu = { format = "{usage}% "; };
        memory = { format = "{}% "; };
        battery = {
          bat = "BAT1";
          states = {
            # good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          # format-good = "", // An empty format will hide the module;
          format-full = "";
          format-icons = [ " " " " " " " " " " ];
          tooltip-format = "{capacity}% {timeTo}";
        };
        network = {
          # interface = "wlp2s0", // (Optional) To force the use of this interface;
          format-wifi = " ";
          format-ethernet = "{ifname} = {ipaddr}/{cidr} ";
          format-disconnected = "Disconnected ⚠";
          on-click = "networkmanager_dmenu";
          tooltip-format-wifi = "{essid} {signalStrength}%";
        };
        pulseaudio = {
          #scroll-step = 1;
          format = "{icon}";
          format-muted = " ";
          tooltip-format = "{desc} {volume}%";
          format-icons = { default = [ " " " " ]; };
          on-click = "pavucontrol";
        };
        # "custom/spotify" = {
        # 		format = " {}";
        # 		max-length = 40;
        # 		interval = 30; # Remove this if your script is endless and write in loop;
        # 		exec = "$HOME/.config/waybar/mediaplayer.sh 2> /dev/null"; # Script in resources folder;
        # 		exec-if = "pgrep spotify";
        # };
      };

    };
    style = builtins.readFile ./style.css;
  };
}

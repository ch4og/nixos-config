{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "custom/spotify" ];
        modules-right = [
          "custom/swaync"
          "tray"
          "pulseaudio"
          "custom/network"
          "battery"
          "hyprland/language"
          "clock"
        ];
        "hyprland/workspaces" = {
          all-outputs = false;
          format = "{icon}";
          format-icons = {
            "6" = " ";
            "7" = " ";
            "9" = " ";
            "1" = " ";
            "2" = " ";
            "5" = " ";
            "urgent" = " ";
            "focused" = " ";
            "default" = " ";
          };
        };
        "hyprland/language" = {
          format = "{}";
          format-en = "🦅";
          format-ru = "💤";
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
        # network = {
        #   interface = "wlp4s0";
        #   format-wifi = " ";
        #   format-disconnected = "⚠";
        #   on-click = "networkmanager_dmenu";
        #   on-click-right = "nmcli connection up ${vpn}";
        #   tooltip-format-wifi = "{essid} {signalStrength}%";
        # };
        pulseaudio = {
          on-scroll-up = "swayosd-client --output-volume raise";
          on-scroll-down = "swayosd-client --output-volume lower";
          #scroll-step = 1;
          format = "{icon}";
          format-muted = " ";
          tooltip-format = "{desc} {volume}%";
          format-icons = { default = [ " " " " ]; };
          on-click = "pavucontrol";
        };
        "custom/network" =
          let vpn = "mitanick-lv4.pvpn.pw-udp";
          in {
            format = "{icon}";
            interval = 3;
            return-type = "json";
            format-icons = {
              "vpn" = "    ";
              "wifi" = "   ";
              "off" = "   ";
            };
            exec = "$HOME/.config/waybar/network.sh --status ${vpn} 2> /dev/null";
            on-click = "networkmanager_dmenu";
            on-click-right = "$HOME/.config/waybar/network.sh --toggle ${vpn}";
          };
        "custom/swaync" = {
          format = "{icon}";
          interval = 1;
          return-type = "json";
          format-icons = {
            "none" = " ";
            "new" = " ";
            "dnd" = "  ";
          };
          exec = "$HOME/.config/waybar/swaync.sh 2> /dev/null";
          tooltip = false;
          on-click = "swaync-client -t";
          on-click-right = "swaync-client -d";
        };

        "custom/spotify" = {
          format = "{icon} {}";
          return-type = "json";
          format-icons = {
            paused = " ";
            playing = "  ";
            default = "";
          };
          interval = 1;
          exec = "$HOME/.config/waybar/spotify.sh 2> /dev/null";
          exec-if = "pgrep spotify";
          on-click = "playerctl -p spotify play-pause";
          on-click-middle = "playerctl -p spotify previous";
          on-click-right = "playerctl -p spotify next";
        };
      };

    };
    style = builtins.readFile ./style.css;
  };
  xdg.configFile = {
    "waybar/network.sh".source = ./network.sh;
    "waybar/spotify.sh".source = ./spotify.sh;
    "waybar/swaync.sh".source = ./swaync.sh;
  };
}

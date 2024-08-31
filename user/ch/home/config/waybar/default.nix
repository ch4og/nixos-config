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
        modules-right = [ "pulseaudio" "network" "battery" "tray" "clock" ];
        "hyprland/workspaces" = {
          all-outputs = false;
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "4" = "";
            "6" = "";
            "7" = "";
            "urgent" = "";
            "focused" = "";
            "default" = "";
          };
        };
        tray = {
          # icon-size = 21;
          spacing = 10;
        };
        clock = { format-alt = "{ = %Y-%m-%d}"; };
        cpu = { format = "{usage}% "; };
        memory = { format = "{}% "; };
        battery = {
          bat = "BAT0";
          states = {
            # good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          # format-good = "", // An empty format will hide the module;
          # format-full = "";
          format-icons = [ "" "" "" "" "" ];
        };
        network = {
          # interface = "wlp2s0", // (Optional) To force the use of this interface;
          format-wifi = " ";
          format-ethernet = "{ifname} = {ipaddr}/{cidr} ";
          format-disconnected = "Disconnected ⚠";
          on-click = "networkmanager_dmenu";
          tooltip = "{signalStrength}% {essid}";
        };
        pulseaudio = {
          #scroll-step = 1;
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            headphones = "";
            headfree = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" ];
          };
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

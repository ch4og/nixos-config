{...}: {
  wayland.windowManager.hyprland.settings.exec-once = [
    "waybar"
    "wl-paste --watch cliphist store"
    "ciadpi --hosts ~/Documents/full_list.txt -r1+s -s1"
    "xwaylandvideobridge"

    "[workspace 7 silent] startzen.sh"
    "[title;workspace 9 silent] env QT_QPA_PLATFORM=xcb telegram-desktop"
    "[title;workspace 1 silent] vesktop"
    "[workspace 2 silent] spotify"
    "[title;workspace 5 silent] steam -silent"
  ];
}

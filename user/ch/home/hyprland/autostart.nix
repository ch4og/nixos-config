{...}: {
  wayland.windowManager.hyprland.settings.exec-once = [
    "waybar"
    "wl-paste --watch cliphist store"
    "ciadpi --hosts ~/Documents/full_list.txt -r1+s -s1"
    "xwaylandvideobridge"

    "[workspace 2 silent] startfirefox.sh"
    "[title;workspace 4 silent] env QT_QPA_PLATFORM=xcb telegram-desktop"
    "[title;workspace 6 silent] sleep 10 && vesktop"
    # "[title;workspace 6 silent] guilded"
    "[workspace 7 silent] spotify"
    # "[workspace 7 silent] yandex-music"
    "[title;workspace 10 silent] steam -silent"
  ];
}

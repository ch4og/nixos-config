{...}: {
  wayland.windowManager.hyprland.settings.exec-once = [
    "waybar"
    "wl-paste --watch cliphist store"
    "vban.sh"

    "[title;workspace 4 silent] telegram-desktop"
    "[workspace 2 silent] firefox"
    "[title;workspace 6 silent] sleep 10 && vesktop --disable-gpu-compositing"
    "[workspace 7 silent] spotify"
    "[title;workspace 10 silent] steam -silent"
  ];
}

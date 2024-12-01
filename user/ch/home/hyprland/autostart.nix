{...}: {
  wayland.windowManager.hyprland.settings.exec-once = [
    "waybar"
    "wl-paste --watch cliphist store"

    "[title;workspace 4 silent] env QT_QPA_PLATFORM=xcb telegram-desktop"
    "[workspace 2 silent] firefox"
    "[title;workspace 6 silent] discordcanary --disable-gpu-compositing"
    "[workspace 7 silent] spotify"
    "[title;workspace 10 silent] steam -silent"
  ];
}

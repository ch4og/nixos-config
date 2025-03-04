{...}: {
  wayland.windowManager.hyprland.settings.exec-once = [
    "uwsm app -- waybar"
    "uwsm app -- wl-paste --watch cliphist store"
    "uwsm app -- vban.sh"

    "[title;workspace 4 silent] uwsm app -- env QT_QPA_PLATFORM=xcb ayugram-desktop"
    "[workspace 2 silent] uwsm app -- firefox"
    "[title;workspace 6 silent] uwsm app -- discord --disable-gpu-compositing"
    "[workspace 7 silent] uwsm app -- spotify"
    "[title;workspace 10 silent] uwsm app -- steam -silent"
  ];
}

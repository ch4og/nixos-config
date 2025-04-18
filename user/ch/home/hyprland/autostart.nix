{...}: {
  wayland.windowManager.hyprland.settings.exec-once = [
    "uwsm app -- waybar"
    "uwsm app -- wl-paste --watch cliphist store"
    "systemctl --user enable --now hyprpolkitagent.service"

    "[title;workspace 24 silent] uwsm app -- ayugram-desktop"
    "[workspace 22 silent] uwsm app -- firefox"
    "[title;workspace 11 silent] uwsm app -- discord --disable-gpu-compositing"
    "[workspace 12 silent] uwsm app -- spotify"
    "[title;workspace 15 silent] uwsm app -- steam -silent"
  ];
}

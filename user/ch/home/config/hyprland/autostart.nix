{ ... }: {
  wayland.windowManager.hyprland.settings.exec-once = [
    "waybar"
    "wl-paste --watch cliphist store"
    "ciadpi --hosts ~/Documents/full_list.txt --tlsrec 1+s -d 1"
    "hyprctl dispatch workspace 1"
  ];
}

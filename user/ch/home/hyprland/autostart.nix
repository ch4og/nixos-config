{ ... }: {
  wayland.windowManager.hyprland.settings.exec-once = [
    "sudo modprobe nvidia-uvm"
    "waybar"
    "wl-paste --watch cliphist store"
    "ciadpi --hosts ~/Documents/full_list.txt --tlsrec 1+s -s 1"

    "[workspace 7 silent] startzen.sh"
    "[title;workspace 9 silent] env QT_QPA_PLATFORM=xcb telegram-desktop"
    "[title;workspace 1 silent] vesktop"
    "[workspace 2 silent] spotify"
    # "[workspace 2 silent] yandex-music"
    "[title;workspace 5 silent] steam -silent"
  ];
}

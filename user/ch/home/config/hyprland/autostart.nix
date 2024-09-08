{ ... }: {
  wayland.windowManager.hyprland.settings.exec-once = [
    # "swayosd-server"
    "sudo modprobe nvidia-uvm"
    "waybar"
    "wl-paste --watch cliphist store"
    "ciadpi --hosts ~/Documents/full_list.txt --tlsrec 1+s -d 1"

    "[workspace 2 silent] startzen.sh"
    "[title;workspace 4 silent] flatpak run org.telegram.desktop"
    "[title;workspace 6 silent] vesktop"
    "[workspace 7 silent] spotify"
    "[title;workspace 5 silent] steam -silent"
  ];
}

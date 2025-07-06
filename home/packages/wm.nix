{pkgs, ...}: {
  home.packages = with pkgs; [
    # Wayland Tools
    wl-clipboard
    hyprpicker
    swappy
    slurp
    grim
    grimblast
    waybar
    hyprsome
    hyprpolkitagent

    # Audio and Video
    pavucontrol
    playerctl
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-libav
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-base

    # Theming and UI
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum

    # Utilities
    copyq
    networkmanager_dmenu
    networkmanagerapplet
    appimage-run
    libimobiledevice
    umu-launcher

    # Media and Entertainment
    ani-cli
    ani-skip
    uxplay
    swayimg
  ];
}

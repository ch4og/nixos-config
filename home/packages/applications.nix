{pkgs, ...}: {
  home.packages = with pkgs; [
    # Browsers
    chromium
    tor-browser

    # Communication
    ayugram.ayugram-desktop
    zoom-us

    # File Sharing
    qbittorrent
    filezilla

    # Productivity
    obsidian
    onlyoffice-bin

    # Media
    mpv
    eog
    olive-editor
    kdePackages.kdenlive

    # Graphics and Design
    krita
    gimp3
    fontforge-gtk
    upscayl

    # System Tools
    file-roller
    remmina

    # Security
    burpsuite
    nekobox.nekobox

    # Gaming
    gamemode
    gamescope
    tetrio-desktop
    byedpi
    freesm.default
    lunar-client
    parsec-bin
    bottles
    heroic
    lutris
    nix-gaming.osu-stable
    nix-gaming.osu-lazer-bin
    torzu
  ];
}

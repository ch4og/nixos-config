{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    # Browsers
    chromium
    tor-browser

    # Communication
    ayugram-desktop
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
    virt-manager

    # Security
    burpsuite
    nekobox

    # Gaming
    gamemode
    gamescope
    tetrio-desktop
    (
      prismlauncher.overrideAttrs
      (_old: {
        jdks = [config.programs.java.package];
      })
    )
    temurin-jre-bin-23
    lunar-client
    parsec-bin
    bottles
    heroic
    lutris
    nix-gaming.osu-stable
    nix-gaming.osu-lazer-bin
  ];
}

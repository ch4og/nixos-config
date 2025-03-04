{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # Coding
    nvf.default
    python3
    python313Packages.pygithub
    python313Packages.opencv4
    python313Packages.pipx
    rustup
    gh
    nix-prefetch
    go
    lazygit
    prettierd
    nodejs
    alejandra
    yarn
    code-cursor
    sqlite

    # Essentials
    ripgrep
    (btop.override {cudaSupport = true;})
    eza
    starship
    jq
    fastfetch
    gtrash
    openvpn
    cudaPackages.cudatoolkit
    wine-staging
    wine64Packages.staging
    bind
    usbutils
    lsof
    nmap
    unrar
    any-nix-shell
    grc
    fd
    dust
    binwalk
    alsa-utils
    yt-dlp
    exiftool
    distrobox
    traceroute

    # Fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    montserrat

    # Desktop tools
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
    wl-clipboard
    ffmpegthumbnailer
    gamemode
    gamescope
    cliphist
    hyprpicker
    swappy
    slurp
    grim
    grimblast
    waybar
    pavucontrol
    networkmanager_dmenu
    playerctl
    libimobiledevice
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-libav
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-base
    vban.default
    uxplay
    ani-cli
    ani-skip

    # Desktop apps
    ayugram-desktop
    qbittorrent
    obsidian
    olive-editor
    eog
    mpv
    tetrio-desktop
    byedpi
    prismlauncher
    lunar-client
    parsec-bin
    file-roller
    krita
    filezilla
    onlyoffice-bin
    chromium
    kdePackages.kdenlive
    remmina
    tor-browser
    burpsuite
    bottles
    heroic
    fontforge-gtk
    nix-gaming.osu-stable
    nix-gaming.osu-lazer-bin
  ];
}

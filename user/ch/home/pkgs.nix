{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # Coding
    nvf.default
    python3
    python312Packages.pygithub
    python312Packages.opencv4
    rustup
    gh
    nix-prefetch
    go
    lazygit
    prettierd
    nodejs
    alejandra
    yarn
    vscode

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
    heroic
    bottles
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

    # Desktop apps
    materialgram
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
    kdenlive
    remmina
  ];
}

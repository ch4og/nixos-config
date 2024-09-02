{ inputs, pkgs, ... }: {
  home.packages = with pkgs; [
    inputs.nixvim.packages.x86_64-linux.default
    telegram-desktop
    python3
    rustup
    bat
    ripgrep
    firefox
    btop
    lsd
    starship
    kitty
    wezterm
    fastfetch
    gh
    nix-prefetch
    go
    zoxide
    fzf
    lazygit
    rmtrash
    openvpn
    qbittorrent

    prettierd
    nixfmt-classic
    black
    vesktop
    spotify
    rofi-wayland
    wl-clipboard
    ffmpegthumbnailer

    overskride
    rofimoji
    cliphist
    hyprpicker
    satty
    slurp
    grim
    grimblast
    waybar
    pavucontrol
    networkmanager_dmenu

    zen-browser.default
  ];
}

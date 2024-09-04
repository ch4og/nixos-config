{ inputs, pkgs, ... }: {
  home.packages = with pkgs; [
    inputs.nixvim.packages.x86_64-linux.default
    python3
    rustup
    ripgrep
    firefox
    btop
    lsd
    starship
    kitty
    wezterm
    fastfetch
    gh
    jq
    nix-prefetch
    go
    lazygit
    rmtrash
    openvpn
    qbittorrent
    obsidian

    prettierd
    nixfmt-classic
    shfmt
    black
    vesktop
    spotify
    rofi-wayland
    wl-clipboard
    ffmpegthumbnailer
    gamemode
    gamescope
    cudaPackages.cudatoolkit
    nvtopPackages.nvidia

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

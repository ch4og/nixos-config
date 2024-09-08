{ inputs, pkgs, ... }: {
  home.packages = with pkgs;
    [
      # Coding
      python3
      rustup
      gh
      nix-prefetch
      go
      lazygit

      # Essentials
      ripgrep
      btop
      lsd
      starship
      jq
      fastfetch
      rmtrash
      openvpn
      cudaPackages.cudatoolkit

      # Desktop tools
      libsForQt5.qtstyleplugin-kvantum
      kdePackages.qtstyleplugin-kvantum
      rofi-wayland
      wl-clipboard
      ffmpegthumbnailer
      gamemode
      gamescope
      overskride
      rofimoji
      # swayosd
      cliphist
      hyprpicker
      satty
      slurp
      grim
      grimblast
      waybar
      pavucontrol
      networkmanager_dmenu

      # Desktop apps
      kitty
      qbittorrent
      obsidian
      vimiv-qt
      mpv
      tetrio-desktop
      vesktop
      spotify
    ] ++ [
      inputs.zen-browser.packages.x86_64-linux.default
      inputs.nvf.packages.x86_64-linux.default
      inputs.aagl.packages.x86_64-linux.anime-game-launcher
      inputs.aagl.packages.x86_64-linux.sleepy-launcher
    ];
}

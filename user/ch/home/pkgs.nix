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
      _64gram
      kitty
      qbittorrent
      obsidian
      vimiv-qt
      mpv
      tetrio-desktop
      vesktop
      spotify
      yandex-music
    ] ++ [
      inputs.zen-browser.packages.x86_64-linux.default
      inputs.nvf.packages.x86_64-linux.default
      inputs.byedpi.packages.x86_64-linux.byedpi
    ];
}

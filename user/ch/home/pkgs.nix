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

      # Fonts
      noto-fonts
      noto-fonts-cjk
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
      overskride
      cliphist
      hyprpicker
      satty
      slurp
      grim
      grimblast
      waybar
      pavucontrol
      networkmanager_dmenu
      playerctl
      libimobiledevice

      # Desktop apps
      telegram-desktop
      kitty
      qbittorrent
      obsidian
      vimiv-qt
      mpv
      tetrio-desktop
      vesktop
      spotify
      yandex-music
      byedpi
    ] ++ [
      inputs.zen-browser.packages.x86_64-linux.default
      inputs.nvf.packages.x86_64-linux.default
    ];
}

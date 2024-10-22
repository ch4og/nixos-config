{ inputs, pkgs, ... }: {
  home.packages = with pkgs;
    [
      # Coding
      python3
      python312Packages.pygithub
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
      wine-staging
      wine64Packages.staging

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
      satty
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
      xwaylandvideobridge

      # Desktop apps
      telegram-desktop
      kitty
      qbittorrent
      obsidian
      olive-editor
      eog
      mpv
      tetrio-desktop
      vesktop
      byedpi
      prismlauncher
      parsec-bin

    ] ++ [
      inputs.zen-browser.packages.x86_64-linux.default
      inputs.nvf.packages.x86_64-linux.default
    ];
}

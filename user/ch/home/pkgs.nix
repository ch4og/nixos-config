{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs;
    [
      # Coding
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

      # Essentials
      ripgrep
      btop
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
      lan-mouse

      # Desktop apps
      telegram-desktop
      kitty
      qbittorrent
      obsidian
      olive-editor
      eog
      mpv
      tetrio-desktop
      byedpi
      prismlauncher
      parsec-bin
      file-roller
      krita
      filezilla
      onlyoffice-bin
      chromium
      kdenlive
      remmina
    ]
    ++ [
      inputs.nvf.packages.x86_64-linux.default
      inputs.vban.packages.x86_64-linux.default
      inputs.uniclip.packages.x86_64-linux.uniclip
    ];
}

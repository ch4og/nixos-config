{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./system/hardware/hardware-configuration.nix
    ./system/hardware/vm-btrfs-settings.nix
    ./system/boot/zen-kernel.nix
    ./system/boot/grub.nix
    ./system/locale.nix
  ];
  networking = {
    hostName = "nixvm";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  virtualisation.hypervGuest.videoMode = "1920x1080";
  services = {
    dbus.enable = true;
    openssh.enable = true;
    libinput.enable = true;
    vscode-server.enable = true;

    xserver = {
      enable = true;
      xkb.layout = "us,ru";
      xkb.options = "grp:alt_shift_toggle";
      desktopManager.xfce.enable = true;
    };
  };

  hardware.pulseaudio.enable = true;

  users.users.ch = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    packages = with pkgs; [
      firefox
      zsh
      btop
      lsd
      starship
      kitty
      konsole
      fastfetch
    ];
  };

  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    killall
    htop
    tree
    alejandra
  ];

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      # substituters = [ "https://aseipp-nix-cache.global.ssl.fastly.net" ];
      substituters = ["https://cosmic.cachix.org/"];
      trusted-public-keys = ["cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="];
      warn-dirty = false;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    optimise.automatic = true;
  };

  system.stateVersion = "24.05";
}

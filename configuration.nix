{
  config,
  lib,
  pkgs,
  ...
}: {
  boot = {
    loader = {
      # systemd-boot.enable = true;
      grub = {
        device = "nodev";
        efiSupport = true;
      };
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_zen;
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback acpi_call xpadneo];
    tmp.cleanOnBoot = true;
  };

  networking = {
    hostName = "nixpc";
    networkmanager.enable = true;
    # wireless.enable = true;
    firewall.enable = false;
  };

  time.timeZone = "Asia/Novosibirsk";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };
  virtualisation.hypervGuest.videoMode = "1920x1080";
  services = {
    dbus.enable = true;
    openssh.enable = true;
    libinput.enable = true;
    vscode-server.enable = true;

    xserver = {
      enable = true;
      # videoDrivers = [ "vmware" ];
      # windowManager.hyprland.enable = true;
      xkb.layout = "us,ru";
      xkb.options = "grp:alt_shift_toggle";
      desktopManager.xfce.enable = true;
    };
    # displayManager.cosmic-greeter.enable = true;
    # desktopManager.cosmic.enable = true;
  };

  # hardware.pulseaudio.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland-git.hyprland.override {debug = true;};
  };

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

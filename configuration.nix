{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./btrfs-compression.nix
    ];

  boot = {
    loader = {
      #systemd-boot.enable = true;
      grub = {
        device = "nodev";
        efiSupport = true;
      };
      efi.canTouchEfiVariables = true;
      };
    kernelPackages = pkgs.linuxPackages_zen;
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback acpi_call xpadneo ];
  };

  networking = {
    hostName = "nixpc";
    networkmanager.enable = true;
    #wireless.enable = true;
    firewall.enable = false;
  };

  time.timeZone = "Asia/Novosibirsk";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  services = {
    dbus.enable = true;
    openssh.enable = true;
    libinput.enable = true;
    vscode-server.enable = true;

    xserver = {
      enable = true;
      videoDrivers = [ "vmware" ];
      #windowManager.hyprland.enable = true;
      xkb.layout = "us,ru";
      xkb.options = "grp:alt_shift_toggle";
    };
  };

  #hardware.graphics.enable = true;
  #hardware.pulseaudio.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  programs.hyprland = {
    enable = true;
    #package = pkgs.stable.hyprland;
  };


  users.users.ch = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
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
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    #substituters = [ "https://aseipp-nix-cache.global.ssl.fastly.net" ];
  };


  system.stateVersion = "24.05";
}


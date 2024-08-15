{ config, lib, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
    ];
  
  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [ "compress=zstd" "noatime" ];
    "/swap".options = [ "noatime" ];
    "/var/log".options = [ "compress=zstd" ];
  };

  #boot.loader.systemd-boot.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixpc";

  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Novosibirsk";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # services.xserver.enable = true;
  services.xserver.videoDrivers = [ "vmware" ];
  # programs.hyprland = {
  #   enable = true;
  # };

  services.xserver.xkb.layout = "us,ru";
  services.xserver.xkb.options = "grp:alt_shift_toggle";

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  services.libinput.enable = true;
  # services.dbus.enable = true;
  users.users.ch = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      zsh
      btop
      lsd
      starship
      kitty
      alacritty
      xterm
      konsole
      wezterm
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

  services.openssh.enable = true;

  networking.firewall.enable = false;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";

}


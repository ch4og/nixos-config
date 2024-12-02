{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];
  environment.systemPackages = import ./pkgs.nix {inherit pkgs;};
  boot = {
    loader.grub = {
      device = "nodev";
      efiSupport = true;
    };
    loader.efi.canTouchEfiVariables = true;

    tmp.cleanOnBoot = true;
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
      acpi_call
      xpadneo
    ];
    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
    blacklistedKernelModules = ["nouveau"];

    kernelPackages = pkgs.linuxPackages_cachyos;
  };
  services.scx = {
    enable = true;
    package = pkgs.scx.full;
    scheduler = "scx_rusty";
  };

  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = ["${XDG_BIN_HOME}"];
    GOPATH = "${XDG_DATA_HOME}/go";
    NIXOS_OZONE_WL = "0";
  };

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };
  time.timeZone = "Europe/Moscow";
  services.xserver = {
    xkb.layout = "us,ru";
    xkb.options = "grp:alt_shift_toggle";
  };
  programs.zsh.enable = true;
  programs.fish.enable = true;
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "dotnet-runtime-6.0.36"
      "dotnet-sdk-wrapped-6.0.428"
      "dotnet-sdk-6.0.428"
    ];
  };
  nix = {
    settings = {
      plugin-files = "${pkgs.nix-plugins}/lib/nix/plugins";
      extra-builtins-file = "${inputs.self}/system/lib/extra-builtins.nix";
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      substituters = [
        "https://aseipp-nix-cache.global.ssl.fastly.net" # cache v2
        "https://ezkea.cachix.org" # aagl
        "https://hyprland.cachix.org" # hyprland
      ];
      trusted-public-keys = [
        "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" # aagl
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" # hyprland
      ];
      warn-dirty = false;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };

    optimise.automatic = true;
  };
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;
  services.locate = {
    enable = true;
    package = pkgs.plocate;
    localuser = null;
  };
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false;
    settings.default-cache-ttl = 4 * 60 * 60;
  };

  system.stateVersion = "24.05";
}

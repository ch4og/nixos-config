{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [./hardware-configuration.nix];

  boot = {
    loader = {
      grub = {
        device = "nodev";
        efiSupport = true;
      };
      efi.canTouchEfiVariables = true;
    };

    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback acpi_call xpadneo];
    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
    blacklistedKernelModules = ["nouveau"];
    kernelPackages = pkgs.linuxPackages_cachyos;

    tmp.cleanOnBoot = true;
  };

  services = {
    scx = {
      enable = true;
      package = pkgs.scx.full;
      scheduler = "scx_rusty";
    };
    xserver = {
      xkb.layout = "us,ru";
      xkb.options = "grp:alt_shift_toggle";
    };
    locate = {
      enable = true;
      package = pkgs.plocate;
    };

    gnome.gnome-keyring.enable = true;
  };

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = false;
      settings.default-cache-ttl = 4 * 60 * 60;
    };

    zsh.enable = true;
    fish.enable = true;
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/ch/Code/Nix/nixos-config";
    };
  };

  environment = {
    systemPackages = import ./pkgs.nix {inherit pkgs;};
    sessionVariables = rec {
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
      XDG_BIN_HOME = "$HOME/.local/bin";
      PATH = ["${XDG_BIN_HOME}"];
      GOPATH = "${XDG_DATA_HOME}/go";
      NIXOS_OZONE_WL = "0";
    };
  };
  xdg.terminal-exec.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };
  time.timeZone = "Europe/Moscow";
  nixpkgs.config = {
    allowUnfree = true;
  };
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      substituters = [
        "https://nix-gaming.cachix.org" # nix-gaming
        "https://ezkea.cachix.org" # aagl
        "https://hyprland.cachix.org" # hyprland
        "https://cache.garnix.io" # garnix nekobox
      ];
      trusted-public-keys = [
        "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" # aagl
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" # hyprland
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" # nix-gaming
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" # garnix nekobox
      ];
      warn-dirty = false;
    };
    optimise.automatic = true;
  };
  security = {
    polkit.enable = true;
    pam.services.sddm.enableGnomeKeyring = true;
  };
  system.stateVersion = "24.05";
}

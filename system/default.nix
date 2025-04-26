{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [./hardware-configuration.nix ../generic/nix.nix];

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
      NIXOS_OZONE_WL = "1";
    };
  };
  xdg.terminal-exec.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };
  time.timeZone = "Europe/Moscow";

  security = {
    polkit.enable = true;
    pam.services.sddm.enableGnomeKeyring = true;
  };
  system.stateVersion = "24.05";
}

{ inputs, config, lib, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];
  environment.systemPackages = import ./pkgs.nix { inherit pkgs; };
  boot = {
    loader.grub = {
      device = "nodev";
      efiSupport = true;
    };
    loader.efi.canTouchEfiVariables = true;

    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_zen;
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
      acpi_call
      xpadneo
    ];
    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
    blacklistedKernelModules = [ "nouveau" ];
  };
  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [ "${XDG_BIN_HOME}" ];
    GOPATH = "${XDG_DATA_HOME}/go";
    # NIXOS_OZONE_WL = "1";
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
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      substituters = [
        "https://ezkea.cachix.org"
        "https://aseipp-nix-cache.global.ssl.fastly.net"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
      warn-dirty = false;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    optimise.automatic = true;
  };
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false;
    settings.default-cache-ttl = 4 * 60 * 60;
  };

  # tried to get "zapret" working, WIP
  # users.users.tpws = {
  #   isSystemUser = true;
  #   group = "tpws";
  # };
  #
  # users.groups.tpws = { };
  #
  # systemd.services.zapret = {
  #   after = [ "network-online.target" ];
  #   wants = [ "network-online.target" ];
  #   wantedBy = [ "multi-user.target" ];
  #
  #   path = with pkgs; [
  #     iptables
  #     nftables
  #     gawk
  #   ];
  #
  #   serviceConfig = {
  #     Type = "forking";
  #     Restart = "no";
  #     TimeoutSec = "30sec";
  #     IgnoreSIGPIPE = "no";
  #     KillMode = "none";
  #     GuessMainPID = "no";
  #     ExecStart = "${pkgs.zapret}/bin/zapret start";
  #     ExecStop = "${pkgs.zapret}/bin/zapret stop";
  #
  #     EnvironmentFile = pkgs.writeText "zapret-environment" ''
  #       MODE="nfqws"
  #       FWTYPE="iptables"
  #       MODE_HTTP=1
  #       MODE_HTTP_KEEPALIVE=0
  #       MODE_HTTPS=1
  #       MODE_QUIC=1
  #       QUIC_PORTS=9993,50000-65535
  #       MODE_FILTER=none
  #       DISABLE_IPV6=1
  #       INIT_APPLY_FW=1
  #       NFQWS_OPT_DESYNC="--dpi-desync=split2"
  #       NFQWS_OPT_DESYNC_QUIC="--dpi-desync=fake --dpi-desync-repeats=8 --dpi-desync-any-protocol --dpi-desync-autottl=1:1-8"
  #     '';
  #   };
  # };

  system.stateVersion = "24.05";
}

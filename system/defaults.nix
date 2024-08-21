{ config, lib, pkgs, ... }: {
  imports = [ ./env.nix ];
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
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      # substituters = [ "https://aseipp-nix-cache.global.ssl.fastly.net" ];
      substituters = [ "https://cosmic.cachix.org/" ];
      trusted-public-keys =
        [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
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

{pkgs, ...}: {
  imports = [
    ../hardware-configuration.nix
    ../../generic/nix.nix

    ../../modules/boot
    ../../modules/hardware
    ../../modules/networking
    ../../modules/security
    ../../modules/services

    ../../user/ch
  ];

  networking.hostName = "nixpc";
  system.stateVersion = "24.05";

  environment.sessionVariables = let
    setEnvVars = {
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
      XDG_BIN_HOME = "$HOME/.local/bin";
      PATH = ["${setEnvVars.XDG_BIN_HOME}"];
      GOPATH = "${setEnvVars.XDG_DATA_HOME}/go";
      NIXOS_OZONE_WL = "1";
    };
  in
    setEnvVars;

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  environment.systemPackages = import ./packages.nix {inherit pkgs;};

  xdg.terminal-exec.enable = true;

  programs.zsh.enable = true;
  programs.fish.enable = true;
}

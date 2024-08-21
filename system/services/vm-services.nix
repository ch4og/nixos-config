{ config, lib, pkgs, ... }: {
  services = {
    openssh.enable = true;
    vscode-server.enable = true;

    xserver = {
      enable = true;
      desktopManager.xfce.enable = true;
    };
  };
}

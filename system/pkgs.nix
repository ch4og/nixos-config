{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    zsh
    killall
    htop
    tree
    alejandra
  ];
}

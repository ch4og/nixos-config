{pkgs, ...}: let
  packages = with pkgs; [
    neovim
    wget
    git
    zsh
    killall
    htop
    tree
    alejandra
  ];
in
  packages

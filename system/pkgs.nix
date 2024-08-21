{pkgs, ...}: let
  packages = with pkgs; [
    wget
    git
    zsh
    killall
    htop
    tree
    nixvim.default
  ];
in
  packages

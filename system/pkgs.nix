{ pkgs, ... }:
let
  packages = with pkgs; [
    wget
    git
    zsh
    killall
    htop
    tree
    p7zip
    file
    unzip
    zip
    ffmpeg
    just
    polkit_gnome
    nvidia-vaapi-driver
  ];
in
packages

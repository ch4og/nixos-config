{pkgs, ...}: let
  packages = with pkgs; [
    python3
    rustup
    bat
    ripgrep
    firefox
    btop
    lsd
    starship
    kitty
    fastfetch
    gh
    nix-prefetch
    go
    prettierd
    zoxide
    fzf
    lazygit
    rmtrash
  ];
in
  packages

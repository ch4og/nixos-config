{ pkgs, ... }:
let
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
    zoxide
    fzf
    lazygit
    rmtrash

    nixvim.default
    prettierd
    nixfmt-classic
    black
		vesktop
		spotify

	zen-browser.default
  ];
in packages

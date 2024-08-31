{ pkgs, inputs, ... }: {
  imports = [
    ./zsh
    ./fastfetch.nix
    ./starship.nix
    ./hyprland.nix
    ./kitty.nix
    ./satty.nix
    ./obs.nix
    ./rofimoji.nix
    ./nm_dmenu.nix
    ./waybar
    ./hyprpaper.nix
    ./swaync.nix
  ];
}


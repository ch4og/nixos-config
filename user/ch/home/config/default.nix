{ pkgs, inputs, ... }: {
  imports = [
    ./zsh
    ./bin
    ./fastfetch.nix
    ./hyprland
    ./bat.nix
    ./kitty.nix
    ./satty.nix
    ./obs.nix
    ./rofimoji.nix
    ./nm_dmenu.nix
    ./waybar
    ./hyprpaper.nix
    ./swaync.nix
    ./theme.nix
    ./mangohud.nix
  ];
}


{ username, pkgs, inputs, ... }: {
  imports = [
    ./zsh
    ./bin
    ./fastfetch.nix
    (import ./hyprland { inherit pkgs inputs; })
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
    ./lf.nix
    ./vimiv.nix
    ./wlogout.nix
    (import ./flatpak.nix { inherit username; })
  ];
}


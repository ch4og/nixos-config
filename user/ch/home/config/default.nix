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
    ./rofi.nix
    ./nm_dmenu.nix
    ./waybar
    ./swaync.nix
    ./theme.nix
    ./mangohud.nix
    ./lf.nix
    ./vimiv.nix
    # (import ./flatpak.nix { inherit username; })
    ./swayosd.nix
    ./defaultapps.nix
    ./desktop.nix
  ];
}


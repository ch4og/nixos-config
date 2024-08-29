{ pkgs, inputs, ... }: {
  imports = [ ./zsh ./fastfetch.nix ./starship.nix ];
}

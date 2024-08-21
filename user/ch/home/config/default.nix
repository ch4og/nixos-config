{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./git.nix
    ./zsh
    ./fastfetch.nix
    ./starship.nix
  ];
}

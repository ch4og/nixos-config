{
  pkgs,
  username ? "ch",
  inputs,
  ...
}: let
  # useGlobalPkgs = true;
  # useUserPackages = true;
  nixFiles = builtins.filter (
    file:
      builtins.match ".*\\.nix" file
      != null
      && file != "default.nix"
      && file != "pkgs.nix"
      && file != "spotify.nix"
      && file != "firefox.nix"
      && file != "discord.nix"
  ) (builtins.attrNames (builtins.readDir ./.));
in {
  nix.package = pkgs.nix;
  nixpkgs.config = {
    allowUnfree = true;
  };
  home.username = username;
  home.homeDirectory = "/home/${username}";
  imports =
    (builtins.map (file: ./${file}) nixFiles)
    ++ [
      (import ./hyprland {inherit pkgs inputs;})
      (import ./pkgs.nix {inherit pkgs inputs;})
      (import ./spotify.nix {inherit pkgs inputs;})
      (import ./firefox.nix {inherit pkgs inputs;})
      (import ./discord.nix {inherit pkgs inputs;})
      (import ./fastfetch)
      ./fish
      ./bin
      ./waybar
    ];
  home.stateVersion = "24.05";
}

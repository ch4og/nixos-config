{
  pkgs,
  username,
  inputs,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${username} = {pkgs, ...}: let
      nixFiles = builtins.filter (
        file:
          builtins.match ".*\\.nix" file
          != null
          && file != "default.nix"
          && file != "pkgs.nix"
          && file != "spotify.nix"
      ) (builtins.attrNames (builtins.readDir ./.));
    in {
      imports =
        (builtins.map (file: ./${file}) nixFiles)
        ++ [
          (import ./hyprland {inherit pkgs inputs;})
          (import ./pkgs.nix {inherit pkgs inputs;})
          (import ./spotify.nix {inherit pkgs inputs;})
          ./bin
          ./waybar
          # ./zsh
          ./nushell
        ];
      home.stateVersion = "24.05";
    };
  };
}

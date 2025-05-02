{
  nixpkgs,
  inputs,
  ...
}: let
  builders = import ./builders.nix {inherit nixpkgs inputs;};
in
  builders
  // {
    forAllSystems = let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
    in
      f: nixpkgs.lib.genAttrs supportedSystems f;
  }

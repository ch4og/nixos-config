{inputs, ...}: {
  nixpkgs.overlays = [
    (import ./packages.nix {inherit inputs;})
    (import ./repos.nix {inherit inputs;})
  ];
}

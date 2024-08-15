{
  description = "ch4og config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    stable.url = "nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vscode-server = {
      url = "github:nix-community/nixos-vscode-server";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      stableOverlay = final: prev:  { stable = inputs.stable.legacyPackages.${prev.system}; };
      stableModule = ({ config, pkgs, ... }: { nixpkgs.overlays = [ stableOverlay ]; });
    in {
      nixosConfigurations.nixpc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          inputs.vscode-server.nixosModules.default
          stableModule
          ./configuration.nix
        ];
      };
    };
}

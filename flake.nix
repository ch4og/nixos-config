{
  description = "ch4og config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    stable.url = "nixpkgs/nixos-24.05";
    master.url = "nixpkgs/master";

    hyprland-git = {
      url = "git+https://github.com/hyprwm/hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland-git";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:ch4og/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:ch4og/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcybersec = {
      url = "github:ch4og/nixcybersec";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      stableOverlay = final: prev: {
        stable = inputs.stable.legacyPackages.${prev.system};
      };
      masterOverlay = final: prev: {
        master = inputs.master.legacyPackages.${prev.system};
      };
      pkgsModules = { config, pkgs, ... }: {
        nixpkgs.overlays = [ stableOverlay masterOverlay ];
      };
    in {
      devShell.x86_64-linux = inputs.nixcybersec.devShell.x86_64-linux;
      nixosConfigurations.nixvm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./nixvm.nix
          pkgsModules

          inputs.home-manager.nixosModules.home-manager
        ];
      };
      nixosConfigurations.nixpc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./nixpc.nix
          pkgsModules
          inputs.home-manager.nixosModules.home-manager
        ];
      };
    };
}

{
  description = "ch4og config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-24.11";
    master.url = "github:nixos/nixpkgs/master";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
    nvf = {
      url = "github:ch4og/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    chaotic = {
      url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    betterfox-nix = {
      url = "github:HeitorAugustoLN/betterfox-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:KaylorBen/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vban = {
      url = "github:ch4og/vban-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    pkgsOverlays = {config, ...}: {
      nixpkgs.overlays = [
        (final: prev: {
          stable = inputs.stable.legacyPackages.${prev.system};
          master = inputs.master.legacyPackages.${prev.system};
          hyprland-git = inputs.hyprland.packages.${prev.system};
          split-monitor-workspaces = inputs.split-monitor-workspaces.packages.${prev.system};
          nvf = inputs.nvf.packages.${prev.system};
          spicetify-nix = inputs.spicetify-nix.legacyPackages.${prev.system};
          nixcord = inputs.nixcord.packages.${prev.system};
          vban = inputs.vban.packages.${prev.system};
        })
      ];
    };
  in {
    nixosConfigurations.nixpc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./nixpc.nix
        inputs.chaotic.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
        pkgsOverlays
      ];
    };
  };
}

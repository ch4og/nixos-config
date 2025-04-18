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

    nvf.url = "github:ch4og/nvf";
    cybersec.url = "github:ch4og/nixcybersec";

    hyprland.url = "github:hyprwm/hyprland?submodules=1";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    betterfox-nix.url = "github:HeitorAugustoLN/betterfox-nix";
    nixcord.url = "github:KaylorBen/nixcord";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nekobox.url = "github:s0me1newithhand7s/nekoflake";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
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
          nvf = inputs.nvf.packages.${prev.system};
          spicetify-nix = inputs.spicetify-nix.legacyPackages.${prev.system};
          nixcord = inputs.nixcord.packages.${prev.system};
          nix-gaming = inputs.nix-gaming.packages.${prev.system};
          nekobox = inputs.nekobox.packages.${prev.system};
        })
      ];
    };
  in {
    devShell = inputs.cybersec.devShell;
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

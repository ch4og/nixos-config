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

    cybersec.url = "github:ch4og/nixcybersec";
    nvf.url = "github:ch4og/nvf";

    hyprland-git.url = "github:hyprwm/hyprland";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    betterfox-nix.url = "github:HeitorAugustoLN/betterfox-nix";
    nixcord.url = "github:KaylorBen/nixcord";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nekobox.url = "github:s0me1newithhand7s/nekoflake";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    pkgsOverlays = _: {
      nixpkgs.overlays = [
        (_final: prev: {
          hyprland-git = inputs.hyprland-git.packages.${prev.system}.hyprland or {};
          nix-gaming = inputs.nix-gaming.packages.${prev.system} or {};
          nekobox = inputs.nekobox.packages.${prev.system}.nekobox or {};
          spicetify-nix = inputs.spicetify-nix.legacyPackages.${prev.system} or {};
          nvf = inputs.nvf.packages.${prev.system}.default or {};
        })
      ];
    };

    username = "ch";

    mkNixosConfiguration = system:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/nixpc
          inputs.chaotic.nixosModules.default
          inputs.home-manager.nixosModules.home-manager
          pkgsOverlays
        ];
      };

    mkHomeConfiguration = system:
      inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit inputs username;
        };
        modules = [
          ./home
          inputs.chaotic.homeManagerModules.default
          pkgsOverlays
        ];
      };

    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);
  in {
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
    devShell = forAllSystems (system: inputs.cybersec.devShells.${system}.default);
    packages = forAllSystems (system: let
      inherit system;
      overlayModule = pkgsOverlays {};
      pkgs = import nixpkgs {
        inherit system;
        overlays = overlayModule.nixpkgs.overlays;
      };
    in {
      nvf = pkgs.nvf;

      nixosConfigurations.nixpc = mkNixosConfiguration system;
      homeConfigurations.${username} = mkHomeConfiguration system;
    });
  };
}

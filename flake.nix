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

    hyprland-git.url = "github:hyprwm/hyprland";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    betterfox-nix.url = "github:HeitorAugustoLN/betterfox-nix";
    nixcord.url = "github:KaylorBen/nixcord";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nekobox.url = "github:s0me1newithhand7s/nekoflake";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    freesm.url = "github:FreesmTeam/FreesmLauncher";
    ayugram.url = "github:ndfined-crp/ayugram-desktop";
    zen-browser.url = "github:youwen5/zen-browser-flake";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    pkgsOverlays = _: {
      nixpkgs.overlays = [
        (final: prev: {
          hyprland-git = inputs.hyprland-git.packages.${prev.system};
          nixcord = inputs.nixcord.packages.${prev.system} or {};
          nix-gaming = inputs.nix-gaming.packages.${prev.system} or {};
          nvf = inputs.nvf.packages.${prev.system} or {};
          nekobox = inputs.nekobox.packages.${prev.system} or {};
          freesm = inputs.freesm.packages.${prev.system} or {};
          ayugram = inputs.ayugram.packages.${prev.system} or {};
          zen-browser = inputs.zen-browser.packages.${prev.system} or {};
          spicetify-nix = inputs.spicetify-nix.legacyPackages.${prev.system} or {};
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
          ./nixpc.nix
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
  in {
    nixosConfigurations.nixpc = mkNixosConfiguration "x86_64-linux";
    homeConfigurations."${username}" = mkHomeConfiguration "x86_64-linux";
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    devShells.x86_64-linux = inputs.cybersec.devShells.x86_64-linux.default;
  };
}

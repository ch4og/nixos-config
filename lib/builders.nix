{
  nixpkgs,
  inputs,
  ...
}: {
  perSystem = system: let
    pkgs = import nixpkgs {
      inherit system;
      inherit ((import ../overlays {inherit inputs;}).nixpkgs) overlays;
    };

    defaultShell = pkgs.mkShell {
      buildInputs = with pkgs; [
        grim
        git
        nh
        statix
        deadnix
      ];
    };
  in {
    formatter = nixpkgs.legacyPackages.${system}.alejandra;
    devShells = {
      cybersec = inputs.cybersec.devShells.${system}.default;
      default = defaultShell;

      fix = defaultShell.overrideAttrs {
        shellHook = ''
          deadnix --exclude hosts/hardware-configuration.nix --edit .
          statix fix -i hosts/hardware-configuration.nix
          alejandra --exclude ./hosts/hardware-configuration.nix .
          exit
        '';
      };
    };

    packages =
      {
        inherit (pkgs) nvf;
      }
      // nixpkgs.lib.optionalAttrs (system == "x86_64-linux") {
        inherit (pkgs) proton-ge-bin;
      };
  };

  mkNixosConfiguration = {
    system,
    hostname ? "nixpc",
    extraModules ? [],
  }:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
      };
      modules =
        [
          ../hosts/${hostname}

          inputs.chaotic.nixosModules.default
          inputs.home-manager.nixosModules.home-manager

          (import ../overlays {inherit inputs;})
        ]
        ++ extraModules;
    };

  mkHomeConfiguration = {
    system,
    username ? "ch",
    extraModules ? [],
  }:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      extraSpecialArgs = {
        inherit inputs username;
      };
      modules =
        [
          ../home

          inputs.chaotic.homeManagerModules.default

          (import ../overlays {inherit inputs;})
        ]
        ++ extraModules;
    };
}

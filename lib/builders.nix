{
  nixpkgs,
  inputs,
  ...
}: {
      forAllSystems = let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
    in
      f: nixpkgs.lib.genAttrs supportedSystems f;
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
    };

    packages =
      {
        inherit (pkgs) nvf;

        fix-all = pkgs.writeShellScriptBin "fix-all" ''
          echo "Running deadnix..."
          ${pkgs.deadnix}/bin/deadnix --exclude hosts/hardware-configuration.nix --edit .

          echo "Running statix fix..."
          ${pkgs.statix}/bin/statix fix -i hosts/hardware-configuration.nix

          echo "Running alejandra..."
          ${pkgs.alejandra}/bin/alejandra --exclude ./hosts/hardware-configuration.nix .

          echo "All formatting complete!"
        '';
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
          inputs.aagl.nixosModules.default
          inputs.sops-nix.nixosModules.sops

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
          inputs.stylix.homeManagerModules.stylix
          inputs.sops-nix.homeManagerModules.sops

          (import ../overlays {inherit inputs;})
        ]
        ++ extraModules;
    };
}

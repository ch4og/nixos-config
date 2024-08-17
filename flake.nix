{
  description = "ch4og config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    stable.url = "nixpkgs/nixos-24.05";

    hyprland-git = {
      url = "git+https://github.com/hyprwm/hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    # nixos-cosmic = {
    #   url = "github:lilyinstarlight/nixos-cosmic";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    stableOverlay = final: prev: {stable = inputs.stable.legacyPackages.${prev.system};};
    gamingOverlay = final: prev: {gaming = inputs.nix-gaming.packages.${prev.system};};
    hyprOverlay = final: prev: {hyprland-git = inputs.hyprland-git.packages.${prev.system};};
    pkgsModules = {
      config,
      pkgs,
      ...
    }: {nixpkgs.overlays = [stableOverlay gamingOverlay hyprOverlay];};
  in {
    nixosConfigurations.nixvm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./nixvm.nix
        inputs.vscode-server.nixosModules.default
        pkgsModules
      ];
    };
  };
}

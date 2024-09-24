{
  description = "ch4og config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    # stable.url = "nixpkgs/nixos-24.05";
    # master.url = "nixpkgs/master";
    # nix-flatpak.url = "github:gmodena/nix-flatpak";

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
    nvf = {
      url = "github:ch4og/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:ch4og/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    {
      devShells.x86_64-linux = inputs.nixcybersec.devShells.x86_64-linux;
      nixosConfigurations.nixpc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./nixpc.nix
          inputs.home-manager.nixosModules.home-manager
        ];
      };
    };
}

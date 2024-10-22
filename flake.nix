{
  description = "ch4og config";

  inputs = {
    # nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs?rev=e1a23eea2ada0132be3eb9f5c8e2e6405b33625b"; # https://nixpk.gs/pr-tracker.html?pr=349783
    stable.url = "github:NixOS/nixpkgs/nixos-24.05";

    hyprland = {
      url = "github:hyprwm/hyprland?submodules=1&rev=01702c5081d542d2ed6e18da95cedd794575b24d"; # https://github.com/hyprwm/Hyprland/pull/8202
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprsplit = {
      url = "github:shezdy/hyprsplit/main";
      inputs.hyprland.follows = "hyprland";
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
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    {
      devShells.x86_64-linux = inputs.nixcybersec.devShells.x86_64-linux;
      nixosConfigurations.nixpc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./nixpc.nix
          inputs.chaotic.nixosModules.default
          inputs.home-manager.nixosModules.home-manager
        ];
      };
    };
}

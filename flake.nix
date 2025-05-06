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

    cybersec.url = "gitlab:ch4og/nixcybersec";
    nvf.url = "gitlab:ch4og/nvf";
    hyprland-git.url = "github:hyprwm/hyprland";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    betterfox-nix.url = "github:HeitorAugustoLN/betterfox-nix";
    nixcord.url = "github:KaylorBen/nixcord";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nekobox.url = "github:s0me1newithhand7s/nekoflake";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    stylix.url = "github:danth/stylix";
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    builders = import ./lib/builders.nix {inherit nixpkgs inputs;};

    username = "ch";
  in {
    formatter = builders.forAllSystems (system: (builders.perSystem system).formatter);
    devShells = builders.forAllSystems (system: (builders.perSystem system).devShells);
    packages = builders.forAllSystems (system: (builders.perSystem system).packages);

    nixosConfigurations.nixpc = builders.mkNixosConfiguration {
      system = "x86_64-linux";
      hostname = "nixpc";
    };

    homeConfigurations.${username} = builders.mkHomeConfiguration {
      system = "x86_64-linux";
      inherit username;
    };
  };
}

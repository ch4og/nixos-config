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
    freesmlauncher.url = "github:FreesmTeam/FreesmLauncher";

    stylix.url = "github:danth/stylix";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    lib = import ./lib {inherit nixpkgs inputs;};

    username = "ch";
  in {
    formatter = lib.forAllSystems (system: (lib.perSystem system).formatter);
    devShells = lib.forAllSystems (system: (lib.perSystem system).devShells);
    packages = lib.forAllSystems (system: (lib.perSystem system).packages);

    nixosConfigurations.nixpc = lib.mkNixosConfiguration {
      system = "x86_64-linux";
      hostname = "nixpc";
    };

    homeConfigurations.${username} = lib.mkHomeConfiguration {
      system = "x86_64-linux";
      inherit username;
    };
  };
}

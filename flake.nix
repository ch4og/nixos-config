{
  description = "ch4og config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-25.05";
    master.url = "github:nixos/nixpkgs/master";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    betterfox-nix.url = "github:HeitorAugustoLN/betterfox-nix";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    cybersec.url = "github:ch4og/nixcybersec";
    nekobox.url = "github:s0me1newithhand7s/nekoflake";
    niri.url = "github:sodiboo/niri-flake";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nixcord.url = "github:KaylorBen/nixcord";
    nvf.url = "github:ch4og/nvf";
    sops-nix.url = "github:Mic92/sops-nix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    stylix.url = "github:danth/stylix";
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

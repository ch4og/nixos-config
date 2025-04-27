{pkgs, ...}: {
  nix = {
    package = pkgs.nixVersions.latest;
    settings = {
      substituters = [
        "https://nixos-bunny-proxy.cofob.dev" # mirror of cache.nixos.org
        "https://nix-community.cachix.org" # nix-community
        "https://cache.garnix.io" # garnix
        "https://nix-gaming.cachix.org" # nix-gaming
        "https://ezkea.cachix.org" # aagl
        "https://hyprland.cachix.org" # hyprland
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" # cache.nixos.org
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" # nix-community
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" # garnix
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" # nix-gaming
        "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" # aagl
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" # hyprland
      ];
      sandbox = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      warn-dirty = false;
      allowed-users = ["@wheel" "root"];
      trusted-users = ["@wheel" "root"];
    };
  };
  nixpkgs.config = {
    allowUnfree = true;
  };
}

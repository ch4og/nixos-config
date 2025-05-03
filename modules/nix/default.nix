{
  inputs,
  pkgs,
  ...
}: {
  nix = {
    package = pkgs.lix;
    settings = let
      getConfig = attr: inputs: builtins.concatMap (input: input.nixConfig.${attr} or []) inputs;
      inputsList = [inputs.aagl inputs.nix-gaming inputs.freesmlauncher];
    in {
      substituters =
        [
          "https://nixos-cache-proxy.cofob.dev" # proxy to cache.nixos.org
          "https://nix-community.cachix.org" # nix-community
          "https://garnix-cache.ch4og.com" # proxy to cache.garnix.io
          "https://hyprland.cachix.org" # hyprland
        ]
        ++ (getConfig "substituters" inputsList);
      trusted-public-keys =
        [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" # cache.nixos.org
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" # nix-community
          "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" # garnix
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" # hyprland
        ]
        ++ (getConfig "trusted-public-keys" inputsList);

      sandbox = true;
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operator"
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

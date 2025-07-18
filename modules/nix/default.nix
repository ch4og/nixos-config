{
  inputs,
  pkgs,
  ...
}: {
  nix = {
    package = pkgs.nixVersions.latest;
    settings = let
      getConfig = attr: inputs: builtins.concatMap (input: input.nixConfig.${attr} or []) inputs;
      inputsList = [inputs.aagl inputs.nix-gaming inputs.chaotic];
    in {
      substituters =
        [
          "https://nixos-cache-proxy.cofob.dev" # proxy to cache.nixos.org
          "https://nix-community.cachix.org" # nix-community
        ]
        ++ (getConfig "substituters" inputsList);
      trusted-public-keys =
        [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" # cache.nixos.org
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" # nix-community
        ]
        ++ (getConfig "trusted-public-keys" inputsList);

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

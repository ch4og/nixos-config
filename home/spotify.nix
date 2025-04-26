{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];
  programs.spicetify = let
    spicePkgs = pkgs.spicetify-nix;
  in {
    enable = true;
    theme = spicePkgs.themes.default;
    colorScheme = "Ocean";
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      groupSession
      powerBar
      betterGenres
    ];
    enabledCustomApps = with spicePkgs.apps; [
      newReleases
    ];
  };
}

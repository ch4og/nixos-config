{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;
    theme = spicePkgs.themes.default;
    colorScheme = "Default";
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

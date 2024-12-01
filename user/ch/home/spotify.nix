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
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      groupSession
      powerBar
      betterGenres
    ];
    theme = spicePkgs.themes.text;
    enabledCustomApps = with spicePkgs.apps; [
      newReleases
    ];
  };
}

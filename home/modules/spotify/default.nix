{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];
  programs.spicetify = let
    spicePkgs = pkgs.spicetify-nix;
  in {
    enable = true;
    theme = lib.mkIf (!config.stylix.enable) spicePkgs.themes.default;
    colorScheme = lib.mkIf (!config.stylix.enable) "Ocean";
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

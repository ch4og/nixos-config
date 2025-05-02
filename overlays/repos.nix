{inputs, ...}: _final: prev: {
  nix-gaming = inputs.nix-gaming.packages.${prev.system} or {};
  spicetify-nix = inputs.spicetify-nix.legacyPackages.${prev.system} or {};
}

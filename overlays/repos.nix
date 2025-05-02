{inputs, ...}: _final: prev: {
  aagl = inputs.aagl.packages.${prev.system} or {};
  nix-gaming = inputs.nix-gaming.packages.${prev.system} or {};
  spicetify-nix = inputs.spicetify-nix.legacyPackages.${prev.system} or {};
}

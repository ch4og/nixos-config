{inputs, ...}: _final: prev: {
  master = inputs.master.legacyPackages.${prev.system} or {};
  stable = inputs.stable.legacyPackages.${prev.system} or {};

  aagl = inputs.aagl.packages.${prev.system} or {};
  nix-gaming = inputs.nix-gaming.packages.${prev.system} or {};
  spicetify-nix = inputs.spicetify-nix.legacyPackages.${prev.system} or {};
}

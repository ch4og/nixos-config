{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.default
    ./plugins.nix
    ./options.nix
    ./keybinds.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;
  };
}

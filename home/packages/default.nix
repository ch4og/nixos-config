_: let
  nixFiles = builtins.filter (
    file:
      builtins.match ".*\\.nix" file
      != null
      && file != "default.nix"
  ) (builtins.attrNames (builtins.readDir ./.));
in {
  imports = builtins.map (file: ./${file}) nixFiles;
}

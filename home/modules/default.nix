{
  pkgs,
  inputs,
  ...
}: let
  dirEntries = builtins.readDir ./.;
  directories =
    builtins.filter (
      name:
        dirEntries.${name} == "directory"
    )
    (builtins.attrNames dirEntries);
in {
  imports = builtins.map (dir: ./${dir}) directories;
}

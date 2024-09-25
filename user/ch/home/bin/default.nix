{ ... }:
let
  # Specify the current directory
  scriptDir = ./.;

  # Get a list of all files in the current directory
  allFiles = builtins.attrNames (builtins.readDir scriptDir);

  # Filter for .sh files
  scripts =
    builtins.filter (name: builtins.match ".*\\.sh$" name != null) allFiles;

  # Create a function to generate the file attributes
  mkFileAttr = name: {
    source = "${scriptDir}/${name}";
    executable = true;
  };

in {
  home.file = builtins.listToAttrs (map (name: {
    name = ".local/bin/${name}";
    value = mkFileAttr name;
  }) scripts);
}


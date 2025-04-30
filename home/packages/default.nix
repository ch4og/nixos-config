{...}: {
  imports = [
    ./development.nix
    ./nix-tools.nix
    ./python-packages.nix
    ./system-utils.nix
    ./fonts.nix
    ./wm.nix
    ./applications.nix
  ];
}

{
  pkgs,
  username,
  ...
}: {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.${username} = {pkgs, ...}: {
    home.packages = import ./pkgs.nix {inherit pkgs;};
    imports = [
      ./config
    ];

    home.stateVersion = "24.05";
  };
}

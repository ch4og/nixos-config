{ pkgs, username, inputs, ... }: {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.${username} = { pkgs, ... }: {
    home.packages = import ./pkgs.nix { inherit pkgs; };
    imports = [ (import ./config { inherit pkgs inputs; }) ];

    home.stateVersion = "24.05";
  };
}

{ pkgs, username, inputs, ... }: {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.${username} = { pkgs, ... }: {
    imports = [
      (import ./config { inherit pkgs inputs; })
      (import ./pkgs.nix { inherit pkgs inputs; })
    ];
    home.stateVersion = "24.05";
  };
}

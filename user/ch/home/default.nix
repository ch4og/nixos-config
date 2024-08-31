{ pkgs, username, inputs, ... }: {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.${username} = { pkgs, ... }: {
    imports = [
      (import ./config { inherit pkgs inputs; })
      (import ./pkgs.nix { inherit pkgs inputs; })
    ];
    home.pointerCursor = {
      gtk.enable = true;
      # x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 16;
    };

    home.stateVersion = "24.05";
  };
}

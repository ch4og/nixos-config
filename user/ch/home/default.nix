{ pkgs, username, inputs, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.${username} = { pkgs, ... }: {
    imports = [
      inputs.nix-flatpak.homeManagerModules.nix-flatpak
      (import ./config { inherit pkgs inputs username; })
      (import ./pkgs.nix { inherit pkgs inputs; })
    ];
    home.stateVersion = "24.05";
  };

}

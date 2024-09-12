{ pkgs, username, inputs, ... }:
let
  nixvirt = inputs.NixVirt;
in
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.${username} = { pkgs, ... }: {
    imports = [
      inputs.NixVirt.homeModules.default
      inputs.nix-flatpak.homeManagerModules.nix-flatpak
      (import ./config { inherit pkgs inputs username nixvirt; })
      (import ./pkgs.nix { inherit pkgs inputs; })
    ];
    home.stateVersion = "24.05";
  };

}

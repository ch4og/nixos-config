{
  config,
  lib,
  pkgs,
  ...
}: let
  username = "ch";
in {
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };
  imports = [
    (import ./home {inherit pkgs username;})
  ];
}

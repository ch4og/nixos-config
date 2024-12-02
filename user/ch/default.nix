{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  username = "ch";
in {
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "libvirtd"
      "docker"
      "podman"
    ];
    shell = pkgs.fish;
  };
  imports = [
    (import ./home {inherit pkgs username inputs;})
    ./programs.nix
  ];
  security.sudo.extraRules = [
    {
      groups = ["wheel"];
      commands = [
        {
          command = "/home/${username}/.local/bin/gmode.sh";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];
}

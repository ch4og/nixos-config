{pkgs, ...}: let
  username = "ch";
in {
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "libvirtd"
      "docker"
      "podman"
      "gamemode"
      "networkmanager"
    ];
    shell = pkgs.fish;
  };
  imports = [
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

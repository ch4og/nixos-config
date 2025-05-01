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
      commands =
        map (cmd: {
          command = cmd;
          options = ["NOPASSWD"];
        }) [
          "/home/${username}/.local/bin/gmode.sh"
          "${pkgs.btrfs-progs}/bin/btrfs subvolume show*"
          "${pkgs.btrfs-progs}/bin/btrfs subvolume list*"
        ];
    }
  ];
}

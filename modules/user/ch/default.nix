{
  pkgs,
  config,
  ...
}: let
  username = "ch";
in {
  users.users.${username} = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.password.path;
    extraGroups = [
      "wheel"
      "libvirtd"
      "docker"
      "podman"
      "gamemode"
      "networkmanager"
    ];
    shell = pkgs.zsh;
  };
  security.sudo.extraRules = [
    {
      groups = ["wheel" "guixbuild" "seat"];
      commands =
        map (cmd: {
          command = cmd;
          options = ["NOPASSWD"];
        }) [
          "${pkgs.btrfs-progs}/bin/btrfs subvolume show*"
          "${pkgs.btrfs-progs}/bin/btrfs subvolume list*"
        ];
    }
  ];
}

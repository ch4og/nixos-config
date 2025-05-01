{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.aagl.nixosModules.default];
  programs = {
    steam = {
      enable = true;
      extraCompatPackages = [pkgs.proton-ge-bin];
    };
    hyprland.enable = true;
    anime-game-launcher.enable = true;
    honkers-railway-launcher.enable = true;
    dconf.enable = true;
  };
  services = {
    tumbler.enable = true;
    gvfs.enable = true;
    samba = {
      enable = true;
      settings = {
        global = {
          "workgroup" = "WORKGROUP";
          "server string" = "nixpc";
          "netbios name" = "nixpc";
          "security" = "user";
          "guest account" = "nobody";
        };
        "share" = {
          "path" = "/home/ch/Share";
          "browsable" = "yes";
          "read only" = "no";
          "guest ok" = "no";
          "create mask" = "0644";
          "directory mask" = "0755";
        };
      };
    };
    samba-wsdd.enable = true;
  };
  hardware.opentabletdriver.enable = true;
}

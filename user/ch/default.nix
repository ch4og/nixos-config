{ config, lib, pkgs, inputs, ... }:
let username = "ch";
in {
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };
  imports =
    [ (import ./home { inherit pkgs username inputs; }) ./programs.nix ];
  security.sudo.extraRules = [{
    groups = [ "wheel" ];
    commands = [{
      command = "/home/ch/.local/bin/gmode.sh";
      options = [ "NOPASSWD" ];
    }];
  }];

}

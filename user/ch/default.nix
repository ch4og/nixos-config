{ config, lib, pkgs, inputs, ... }:
let username = "ch";
in {
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "wireshark" ];
    shell = pkgs.zsh;
  };
  imports =
    [ (import ./home { inherit pkgs username inputs; }) ./programs.nix ];
  security.sudo.extraRules = [{
    groups = [ "wheel" ];
    commands = [
      {
        command = "/home/${username}/.local/bin/gmode.sh";
        options = [ "NOPASSWD" ];
      }
      {
        command = "/run/current-system/sw/bin/modprobe nvidia-uvm";
        options = [ "NOPASSWD" ];
      }
    ];
  }];

}

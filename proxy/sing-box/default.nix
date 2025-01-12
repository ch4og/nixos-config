{
  config,
  pkgs,
  lib,
  ...
}: let
  creds = builtins.extraBuiltins.readSops ./creds.nix.enc;
in {
  services.sing-box = {
    enable = true;
    settings = {
      log.level = "error";
      dns = import ./dns.nix {inherit creds;};
      inbounds = import ./tun.nix;
      outbounds = import ./outbounds {inherit lib creds;};
      route = import ./route {inherit pkgs;};
    };
  };
}

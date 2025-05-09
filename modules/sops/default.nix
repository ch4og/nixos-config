{
  config,
  lib,
  ...
}: {
  config = {
    sops = let
      sopsDir = ../../secrets;
      systemSops = "${sopsDir}/system.yaml";
    in {
      defaultSopsFile = systemSops;
      age.keyFile = "/var/lib/sops-nix/key.txt";

      secrets = {
        password = lib.mkIf (config ? "system") {};
      };
    };
  };
}

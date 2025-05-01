{
  pkgs,
  username ? "ch",
  inputs,
  ...
}: {
  imports = [
    (import ./modules {inherit pkgs inputs;})
    (import ./packages {inherit pkgs inputs;})
    ../generic/nix.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
  };
}

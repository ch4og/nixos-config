{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./git.nix
    (import ./nixvim {inherit pkgs inputs;})
  ];
}

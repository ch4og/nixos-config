{pkgs, ...}: {
  imports = [
    ./lsp.nix
    ./cmp.nix
    ./conform.nix
  ];
}

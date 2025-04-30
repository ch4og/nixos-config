{pkgs, ...}: {
  home.packages = with pkgs; [
    nix-prefetch
    alejandra
    nixfmt-rfc-style
    deadnix
    nil
    statix
    nix-output-monitor
    nh
    any-nix-shell
  ];
}

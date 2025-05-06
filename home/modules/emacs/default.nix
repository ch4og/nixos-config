{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-nox;
    # extraPackages = with pkgs.emacsPackages; [];
    extraConfig = ''
    '';
  };
}

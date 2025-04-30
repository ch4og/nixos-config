{pkgs, ...}: {
  home.packages = with pkgs.python313Packages; [
    pygithub
    opencv4
    pipx
  ];
}

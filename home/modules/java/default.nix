{pkgs, ...}: {
  programs.java = {
    enable = true;
    package = pkgs.temurin-jre-bin-23;
  };
}

{pkgs, ...}: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      format = "  $all";
    };
  };
}

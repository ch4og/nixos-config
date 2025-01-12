{pkgs, ...}: {
  programs.bat = {
    enable = true;
    # https://nixpk.gs/pr-tracker.html?pr=373146
    extraPackages = with pkgs.master.bat-extras; [
      batgrep
      batdiff
      batman
      batpipe
      batwatch
    ];
  };
}

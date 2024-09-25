{ pkgs, ... }: {
  programs.lf = {
    enable = true;
    previewer = {
      keybinding = "i";
      source = "${pkgs.ctpv}/bin/ctpv";
    };
    extraConfig = ''
      &${pkgs.ctpv}/bin/ctpv -s $id
      cmd on-quit %${pkgs.ctpv}/bin/ctpv -e $id
      set cleaner ${pkgs.ctpv}/bin/ctpvclear
    '';
  };
}

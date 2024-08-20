{pkgs, ...}: {
  programs.nixvim.plugins.dashboard = {
    enable = true;
    settings = {
      change_to_vcs_root = true;
      config = {
        footer = [
          "Hi, ch4og!"
        ];
        header = [
          "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
          "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
          "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
          "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
          "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
          "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
          ""
          ""
        ];
        center = [
          {
            action = "FzfLua files";
            desc = " Find File";
            icon = " ";
            key = "e";
          }
          {
            action = "ene | startinsert";
            desc = " New File";
            icon = " ";
            key = "n";
          }
          {
            action = "FzfLua oldfiles";
            desc = " Recent Files";
            icon = " ";
            key = "r";
          }
          {
            action = "FzfLua live_grep";
            desc = " Find Text";
            icon = " ";
            key = "f";
          }
          {
            action = {
              __raw = "function() require(\"persistence\").load() end";
            };
            desc = " Restore Session";
            icon = " ";
            key = "s";
          }
          {
            action = "LazyGit";
            desc = " LazyGit";
            icon = " ";
            key = "g";
          }
          {
            action = "qa";
            desc = " Quit";
            icon = " ";
            key = "q";
          }
        ];
      };
      theme = "doom";
    };
  };
}

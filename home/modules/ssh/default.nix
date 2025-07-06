_: {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "csmpro.ru" = {
        port = 2222;
      };
      "v.ch4og.com" = {
        port = 2222;
        forwardAgent = true;
      };
      "cheese.ch4og.com" = {
        port = 2222;
        forwardAgent = true;
      };
      "noko.local" = {
        port = 2222;
        forwardAgent = true;
      };
      "gitlab.com" = {
        user = "git";
      };
      "codeberg.org" = {
        user = "git";
      };
      "github.com" = {
        user = "git";
      };
    };
  };
  services.ssh-agent.enable = true;
}

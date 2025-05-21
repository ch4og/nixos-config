_: {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "csmpro.ru" = {
        hostname = "csmpro.ru";
        identityFile = "~/.ssh/csm_id_ed25519";
        port = 2222;
      };
      "v.ch4og.com" = {
        hostname = "v.ch4og.com";
        identityFile = "~/.ssh/id_ed25519_vpn";
        port = 2222;
      };
      "cheese.ch4og.com" = {
        hostname = "cheese.ch4og.com";
        identityFile = "~/.ssh/id_ed25519_cheese";
        port = 2222;
      };
      "gitlab.com" = {
        hostname = "gitlab.com";
        identityFile = "~/.ssh/id_ed25519_ch4og";
      };
      "github.com" = {
        hostname = "github.com";
        identityFile = "~/.ssh/id_ed25519_ch4og";
      };
    };
  };
}

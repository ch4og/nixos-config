{config, ...}: {
  home.sessionVariables = {
    EDITOR = "nvim";
    TSOCKS_CONF_FILE = "${config.xdg.configHome}/tsocks.conf";
  };
}

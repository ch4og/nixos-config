{
  programs.nushell = {
    enable = true;

    configFile.source = ./config.nu;
    # envFile.source = ./env.nu;
    loginFile.source = ./login.nu;

    shellAliases = import ./aliases.nix;
  };
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    settings = {
      add_newline = true;
      format = "[](white)  $all";
    };
  };
  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };
}

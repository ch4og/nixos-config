{pkgs, ...}: {
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      historySubstringSearch = {
        enable = true;
        searchUpKey = "$terminfo[kcuu1]";
        searchDownKey = "$terminfo[kcud1]";
      };
      history = {
        extended = true;
        expireDuplicatesFirst = true;
      };
      initContent =
        (builtins.readFile ./init.zsh)
        + ''
          any-nix-shell zsh --info-right | source /dev/stdin
        '';
      shellAliases = import ./aliases.nix;
    };
    eza = {
      enable = true;
      icons = "auto";
      enableZshIntegration = true;
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = true;
        format = "  $all";
      };
    };
  };
}

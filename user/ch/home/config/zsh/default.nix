{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch = {
      enable = true;
      searchUpKey = "$terminfo[kcuu1]";
      searchDownKey = "$terminfo[kcud1]";
    };

    history.size = 50000;
    zplug = {
      enable = true;
      plugins = [
        {name = "mafredri/zsh-async";}
        {name = "hlissner/zsh-autopair";}
        {name = "jirutka/zsh-shift-select";}
      ];
    };
    shellAliases = import ./aliases.nix;
    initExtra = builtins.readFile ./init.zsh;
  };
  programs.fzf.enableZshIntegration = true;
  programs.zoxide.enableZshIntegration = true;
  programs.starship.enableZshIntegration = true;
}

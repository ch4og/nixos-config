{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userEmail = "mitanick@ya.ru";
    userName = "ch4og";
    extraConfig = {
      pull.rebase = true;
      rebase.autostash = true;
    };
  };
}

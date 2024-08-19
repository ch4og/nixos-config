{pkgs, ...}: {
  programs.nixvim = {
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
      };
    };
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
    globals = {
      mapleader = " ";
    };
    clipboard.register = "unnamedplus";
  };
}

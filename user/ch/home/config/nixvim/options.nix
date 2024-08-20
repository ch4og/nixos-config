{pkgs, ...}: {
  programs.nixvim = {
    opts = {
      updatetime = 100;
      number = true;
      relativenumber = true;
      scrolloff = 4;
      clipboard = "unnamedplus";
      #expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      smartindent = true;
      autoindent = true;
    };
    globals = {
      mapleader = " ";
    };
  };
}

{pkgs, ...}: {
  programs.nixvim = {
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

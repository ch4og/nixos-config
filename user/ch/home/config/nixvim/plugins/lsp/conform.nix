{pkgs, ...}: {
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    formatOnSave = {
      lspFallback = true;
      timeoutMs = 1000;
    };
    notifyOnError = true;
    formattersByFt = {
      javascript = [["prettierd" "prettier"]];
      json = [["prettierd" "prettier"]];
      yaml = [["prettierd" "prettier"]];
      markdown = [["prettierd" "prettier"]];
      html = [["prettierd" "prettier"]];
      go = ["gofmt"];
      python = ["black"];
      nix = ["nixfmt" "alejandra"];
    };
  };
}

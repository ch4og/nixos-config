{pkgs, ...}: {
  programs.nixvim.plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      tsserver.enable = true;
      lua-ls = {
        enable = true;
        settings.telemetry.enable = false;
      };
      rust-analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      gopls = {
        enable = true;
      };
      nixd = {
        enable = true;
      };
    };
  };
}

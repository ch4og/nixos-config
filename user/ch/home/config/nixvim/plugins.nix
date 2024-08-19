{pkgs, ...}: {
  programs.nixvim.plugins = {
    bufferline.enable = true;
    lualine.enable = true;
    telescope.enable = true;
    treesitter.enable = true;
    luasnip.enable = true;
    comment.enable = true;
    nvim-tree.enable = true;
    lazygit.enable = true;
    presence-nvim.enable = true;
    which-key.enable = true;
    wakatime.enable = true;

    fzf-lua = {
      enable = true;
      profile = "telescope";
    };
    lsp = {
      enable = true;
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
      };
    };

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings.sources = [
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "buffer";}
      ];

      settings.mapping = {
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<leader><Tab>" = ''          cmp.mapping(
                      function(fallback)
                        if cmp.visible() then
                          cmp.select_next_item()
                        else
                          fallback()
                        end
                      end,
                    {'i', 's'})'';
      };
    };
  };
  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
    {
      plugin = supermaven-nvim;
      config = "lua require(\"supermaven-nvim\").setup({keymaps = {accept_suggestion = \"<Tab>\"} })";
    }
  ];
}

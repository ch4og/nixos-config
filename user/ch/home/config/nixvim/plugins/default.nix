{pkgs, ...}: {
  imports = [
    ./dashboard.nix
    ./lsp
  ];
  programs.nixvim.plugins = {
    bufferline.enable = true;
    lualine.enable = true;
    telescope.enable = true;
    luasnip.enable = true;
    comment.enable = true;
    nvim-tree.enable = true;
    lazygit.enable = true;
    presence-nvim.enable = true;
    which-key.enable = true;
    wakatime.enable = true;
    autoclose.enable = true;
    lint.enable = true;
    todo-comments.enable = true;
    persistence.enable = true;

    treesitter = {
      enable = true;
      settings = {
        ensure_installed = "all";
        highlight = {enable = true;};
        indent = {enable = true;};
      };
    };
    noice = {
      enable = true;
      presets = {
        bottom_search = true;
        command_palette = true;
        long_message_to_split = true;
      };
    };
    indent-blankline = {
      enable = true;
      settings = {
        indent = {
          char = "│";
          tab_char = "│";
        };
        scope = {
          show_start = false;
          show_end = false;
        };
        exclude = {
          filetypes = [
            "help"
            "alpha"
            "dashboard"
            "neo-tree"
            "Trouble"
            "trouble"
            "lazy"
            "mason"
            "notify"
            "toggleterm"
            "lazyterm"
          ];
        };
      };
    };
    gitsigns = {
      enable = true;
      settings.current_line_blame = true;
    };
    flash = {
      enable = true;
      settings.modes.search = {
        enabled = true;
      };
    };

    fzf-lua = {
      enable = true;
      profile = "telescope";
    };
  };
  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
    {
      plugin = supermaven-nvim;
      config = "lua require(\"supermaven-nvim\").setup({keymaps = {accept_suggestion = \"<C-space>\"} })";
    }
    {
      plugin = midnight-nvim;
    }
    {
      plugin = vim-suda;
      config = "let g:suda_smart_edit = 1";
    }
  ];
}

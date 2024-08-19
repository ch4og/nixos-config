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
    autoclose.enable = true;

    todo-comments.enable = true;
    persistence.enable = true;

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
    dashboard = {
      enable = true;
      settings = {
        change_to_vcs_root = true;
        config = {
          footer = [
            "Hi, ch4og!"
          ];
          header = [
            "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
            "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
            "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
            "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
            "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
            "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
            ""
            ""
          ];
          center = [
            {
              action = "FzfLua files";
              desc = " Find File";
              icon = " ";
              key = "e";
            }
            {
              action = "ene | startinsert";
              desc = " New File";
              icon = " ";
              key = "n";
            }
            {
              action = "FzfLua oldfiles";
              desc = " Recent Files";
              icon = " ";
              key = "r";
            }
            {
              action = "FzfLua live_grep";
              desc = " Find Text";
              icon = " ";
              key = "f";
            }
            {
              action = {
                __raw = "function() require(\"persistence\").load() end";
              };
              #"lua require(" persistence ").load()";
              desc = " Restore Session";
              icon = " ";
              key = "s";
            }
            {
              action = "LazyGit";
              desc = " LazyGit";
              icon = " ";
              key = "g";
            }
            {
              action = "qa";
              desc = " Quit";
              icon = " ";
              key = "q";
            }
          ];
        };
        theme = "doom";
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
    {
      plugin = midnight-nvim;
    }
  ];
}

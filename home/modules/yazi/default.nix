{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    flavors = {
      tokyonight-night =
        pkgs.fetchFromGitHub {
          owner = "kalidyasin";
          repo = "yazi-flavors";
          rev = "e5b6b854a03f36f0db4d12c547db143c6118fa32";
          hash = "sha256-LCqcu+/zU2V7nYPqH4Uyzms1+NO+iAvhP8GsyR+dW2s=";
        }
        + "/tokyonight-night.yazi";
    };

    plugins = with pkgs.yaziPlugins; {
      inherit git ouch glow duckdb lazygit time-travel full-border;
    };
    initLua = ''
      require("git"):setup()
      require("duckdb"):setup()
      require("full-border"):setup {
       type = ui.Border.ROUNDED,
      }
    '';

    keymap = {
      manager.prepend_keymap = [
        {
          on = "C";
          run = "plugin ouch";
          desc = "Compress with ouch";
        }
        {
          on = "H";
          run = "plugin duckdb -1";
          desc = "Scroll one column to the left";
        }
        {
          on = "L";
          run = "plugin duckdb +1";
          desc = "Scroll one column to the right";
        }
        {
          on = ["g" "i"];
          run = "plugin lazygit";
          desc = "Run lazygit";
        }
        {
          on = ["z" "h"];
          run = "plugin time-travel --args=prev";
          desc = "Go to previous snapshot";
        }
        {
          on = ["z" "l"];
          run = "plugin time-travel --args=next";
          desc = "Go to next snapshot";
        }
        {
          on = ["z" "e"];
          run = "plugin time-travel --args=exit";
          desc = "Exit browsing snapshots";
        }
      ];
    };
    settings = {
      manager = {
        show_hidden = true;
        ratio = [1 2 5];
      };
      plugin = {
        prepend_fetchers =
          map (name: {
            inherit name;
            id = "git";
            run = "git";
          }) [
            "*"
            "*/*"
          ];
        prepend_previewers =
          (map (mime: {
              inherit mime;
              run = "ouch";
            }) [
              "application/*zip"
              "application/zip"
              "application/x-tar"
              "application/x-bzip2"
              "application/x-7z-compressed"
              "application/x-rar"
              "application/x-xz"
              "application/xz"
            ])
          ++ [
            {
              name = "*.md";
              run = "glow";
            }
          ]
          ++ (map (name: {
              inherit name;
              run = "duckdb";
            }) [
              "*.csv"
              "*.tsv"
              "*.json"
              "*.parquet"
              "*.txt"
              "*.xlsx"
              "*.db"
              "*.duckdb"
            ]);
        prepend_preloaders =
          map (name: {
            inherit name;
            run = "duckdb";
            multi = false;
          }) [
            "*.csv"
            "*.tsv"
            "*.json"
            "*.parquet"
            "*.txt"
            "*.xlsx"
            "*.db"
            "*.duckdb"
          ];
      };
    };
    theme.flavor = {
      dark = "tokyonight-night";
      light = "tokyonight-night";
    };
    enableZshIntegration = true;
  };
}

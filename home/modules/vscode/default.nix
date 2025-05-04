{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.vscode = {
    enable = true;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;

      extensions = with pkgs.vscode-extensions;
        [
          github.vscode-github-actions
          github.copilot
          github.copilot-chat
          github.vscode-pull-request-github
          eamodio.gitlens
          bbenoist.nix
          ms-python.python
          ms-vscode-remote.remote-ssh
          ms-vscode-remote.remote-ssh-edit
          supermaven.supermaven
          bradlc.vscode-tailwindcss
          enkia.tokyo-night
          vscodevim.vim
          wakatime.vscode-wakatime
        ]
        ++ [pkgs.master.vscode-extensions.yy0931.vscode-sqlite3-editor];
      userSettings = {
        "editor.fontFamily" = lib.mkIf (!config.stylix.enable) "ComicCode Nerd Font";
        "workbench.colorTheme" = lib.mkForce "Tokyo Night";
        "git.enableSmartCommit" = true;
        "git.autofetch" = true;
        "git.confirmSync" = false;
        "security.workspace.trust.untrustedFiles" = "open";
        "deepseek.lang" = "en";
        "supermaven.enable" = {
          "*" = true;
        };

        "window.customMenuBarAltFocus" = false;
        "vim.useSystemClipboard" = true;
        "explorer.fileNesting.patterns" = {
          "*.ts" = "\${capture}.js";
          "*.js" = "\${capture}.js.map, \${capture}.min.js, \${capture}.d.ts";
          "*.jsx" = "\${capture}.js";
          "*.tsx" = "\${capture}.ts";
          "tsconfig.json" = "tsconfig.*.json";
          "package.json" = "package-lock.json, yarn.lock, pnpm-lock.yaml, bun.lockb, bun.lock";
          "*.sqlite" = "\${capture}.\${extname}-*";
          "*.db" = "\${capture}.\${extname}-*";
          "*.sqlite3" = "\${capture}.\${extname}-*";
          "*.db3" = "\${capture}.\${extname}-*";
          "*.sdb" = "\${capture}.\${extname}-*";
          "*.s3db" = "\${capture}.\${extname}-*";
        };
        "http.proxy" = "http://127.0.0.1:2080";
      };
    };
  };
}

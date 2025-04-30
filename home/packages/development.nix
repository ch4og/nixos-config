{pkgs, ...}: {
  home.packages = with pkgs; [
    # Programming Languages
    python3Full
    rustup
    go
    nodejs
    yarn

    # Development Environments
    vscode
    nvf.default
    code-cursor

    # Version Control and Collaboration
    gh
    lazygit

    # Code Formatting and Linting
    prettierd

    # Databases
    sqlite
  ];
}

{pkgs, ...}: {
  home.packages = with pkgs; [
    # Programming Languages
    python3Full
    rustup
    go
    nodejs
    yarn

    # Development Environments
    neovim

    # Version Control and Collaboration
    gh
    lazygit

    # Code Formatting and Linting
    prettierd

    # Databases
    sqlite

    glow
    duckdb
    ouch
  ];
}

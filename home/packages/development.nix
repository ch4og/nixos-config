{pkgs, ...}: {
  home.packages =
    (with pkgs; [
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
      glab
      lazygit

      # Code Formatting and Linting
      prettierd

      # Databases
      sqlite
    ])
    ++ (with pkgs.python313Packages; [
      pygithub
      opencv4
      pipx
    ]);
}

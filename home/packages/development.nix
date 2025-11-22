{pkgs, ...}: {
  home.packages =
    (with pkgs; [
      # Programming Languages
      python3
      rustup
      go
      nodejs
      yarn
      bun

      # Development Environments
      neovim
      helix
      zellij
      tmux

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
      tkinter
      pygithub
      opencv4
      pipx
    ]);
}

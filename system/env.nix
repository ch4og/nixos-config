{...}: {
  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      "$XDG_BIN_HOME"
    ];
    GOPATH = "$XDG_DATA_HOME/go";
    LESS = "-R --use-color -Dd+r$Du+b$";
  };
}

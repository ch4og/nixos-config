{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "suppressevent maximize, class:.*"
      "maximize, title:(satty)"
      "fullscreen, title:(Media viewer)"
      "noanim, title:(Media viewer)"
      "noblur, class:(windowkill)"
      "noblur, class:(64Gram)"
      "float, title:(Picture-in-Picture)"
      "float, title:(MainPicker)"
      "pin, title:(Picture-in-Picture)"
      "workspace 1, class:^(vesktop)$"
      "workspace 2, class:^(Spotify)$"
    ];
  };
}

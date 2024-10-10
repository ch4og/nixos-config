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
      "workspace 6, class:^(vesktop)$"
      "workspace 6, class:^(Guilded)$"
      "workspace 7, class:^(Spotify)$"
      "opacity 0.0 override, class:^(xwaylandvideobridge)$"
      "noanim, class:^(xwaylandvideobridge)$"
      "noinitialfocus, class:^(xwaylandvideobridge)$"
      "maxsize 1 1, class:^(xwaylandvideobridge)$"
      "noblur, class:^(xwaylandvideobridge)$"
    ];
  };
}

{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "noblur,class:^()$,title:^()$" # Fix blur of some gtk menus
      "suppressevent maximize, class:.*"
      "fullscreen, title:(Media viewer)"
      "noanim, title:(Media viewer)"
      "noblur, class:(windowkill)"
      "noblur, class:(io.github.kukuruzka165.materialgram)"
      "float, title:(Picture-in-Picture)"
      "float, title:(MainPicker)"
      "pin, title:(Picture-in-Picture)"
      "workspace 6, class:^(vesktop)$"
      "workspace 6, class:^(discord)$"
      "workspace 7, class:^(Spotify)$"
      "opacity 0.0 override, class:^(xwaylandvideobridge)$"
      "noanim, class:^(xwaylandvideobridge)$"
      "noinitialfocus, class:^(xwaylandvideobridge)$"
      "maxsize 1 1, class:^(xwaylandvideobridge)$"
      "noblur, class:^(xwaylandvideobridge)$"
    ];
  };
}

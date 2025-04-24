{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "noblur,class:^()$,title:^()$" # Fix blur of some gtk menus
      "suppressevent maximize, class:.*"
      "fullscreen, title:(Media viewer)"
      "noanim, title:(Media viewer)"
      "noblur, class:(windowkill)"
      "noblur, class:(com.ayugram.desktop)"
      "float, title:(Picture-in-Picture)"
      "float, title:(MainPicker)"
      "float, class:^(com.github.hluk.copyq)"
      "pin, title:(Picture-in-Picture)"
      "workspace 11, class:^(vesktop)$"
      "workspace 11, class:^(discord)$"
      "workspace 12, class:^(Spotify)$"
      "opacity 0.0 override, class:^(xwaylandvideobridge)$"
      "noanim, class:^(xwaylandvideobridge)$"
      "noinitialfocus, class:^(xwaylandvideobridge)$"
      "maxsize 1 1, class:^(xwaylandvideobridge)$"
      "noblur, class:^(xwaylandvideobridge)$"
    ];
  };
}

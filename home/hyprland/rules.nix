let
  mkFloat = type: title: "float, ${type}:(${title})";

  mkNoblur = type: title: "noblur, ${type}:(${title})";

  mkWorkspace = number: type: title: "workspace ${number}, ${type}:(${title})";

  defaultRules = [
    (mkNoblur "class" "^()$")
    (mkNoblur "title" "^()$")
    "suppressevent maximize, class:.*"
  ];

  xwaylandvideobridgeRules = let
    name = "xwaylandvideobridge";
  in [
    "opacity 0.0 override, class:^(${name})$"
    "noanim, class:^(${name})$"
    "noinitialfocus, class:^(${name})$"
    "maxsize 1 1, class:^(${name})$"
    "noblur, class:^(${name})$"
  ];

  floatingApps = [
    (mkFloat "class" "com.github.hluk.copyq")
    (mkFloat "class" "nm-connection-editor")
    (mkFloat "title" "Picture-in-Picture")
    (mkFloat "title" "MainPicker")
    (mkFloat "title" "File Operation Progress")
    (mkFloat "title" "Confirm to replace files")
    (mkFloat "title" "Save File")
    (mkFloat "title" "Open File")
    (mkFloat "title" "Media viewer")
    "pin, title:(Picture-in-Picture)"
  ];

  noBlurApps = [
    (mkNoblur "class" "windowkill")
    (mkNoblur "class" "com.ayugram.desktop")
  ];

  workspaceAssignments = [
    (mkWorkspace "11" "class" "vesktop")
    (mkWorkspace "11" "class" "discord")
    (mkWorkspace "12" "class" "Spotify")
  ];
in {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 =
      defaultRules
      ++ workspaceAssignments
      ++ xwaylandvideobridgeRules
      ++ floatingApps
      ++ noBlurApps;

    layerrule = [
      "blur, waybar"
      "blur, rofi"
      "blur, launcher"
      "blur, notifications"
      "ignorezero, notifications"
      "ignorezero, waybar"
    ];
  };
}

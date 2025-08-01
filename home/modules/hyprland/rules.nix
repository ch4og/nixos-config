let
  mkFloat = type: title: "float, ${type}:(${title})";

  mkNoblur = type: title: "noblur, ${type}:(${title})";

  mkWorkspace = number: type: title: "workspace ${number}, ${type}:(${title})";

  mkFullscreen = type: title: "fullscreen, ${type}:(${title})";

  defaultRules = [
    (mkNoblur "class" "^()$")
    (mkNoblur "title" "^()$")
    "suppressevent maximize, class:.*"
  ];
in {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 =
      defaultRules
      ++ [
        # floating
        (mkFloat "class" "com.github.hluk.copyq")
        (mkFloat "class" "nm-connection-editor")
        (mkFloat "title" "Picture-in-Picture")
        (mkFloat "title" "MainPicker")
        (mkFloat "title" "File Operation Progress")
        (mkFloat "title" "Confirm to replace files")
        (mkFloat "title" "Save File")
        (mkFloat "title" "Open File")
      ]
      ++ [
        # fullscreen
        (mkFullscreen "title" "Media viewer")
      ]
      ++ [
        # no blur
        (mkNoblur "class" "com.ayugram.desktop")
      ]
      ++ [
        # workspaces
        (mkWorkspace "6" "class" "vesktop")
        (mkWorkspace "7" "class" "spotify")
      ]
      ++ [
        "opacity 0.7 override,tag:transparent"
        "noblur, tag:transparent"
      ];

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

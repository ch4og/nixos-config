let
  mkFloat = type: title: "float, ${type}:(${title})";

  mkNoblur = type: title: "noblur, ${type}:(${title})";

  mkWorkspace = number: type: title: "workspace ${number}, ${type}:(${title})";

  mkFullscreen = type: title: "fullscreen, ${type}:(${title})";

  mkPin = type: title: "pin, ${type}:(${title})";

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
        # pin
        (mkPin "title" "Picture-in-Picture")
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
        (mkWorkspace "1" "class" "vesktop")
        (mkWorkspace "2" "class" "spotify")
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

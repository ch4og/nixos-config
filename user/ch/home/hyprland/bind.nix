{...}: {
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "ghostty";
    "$fileManager" = "thunar";
    "$browser" = "firefox";
    "$menu" = "rofi -show drun -show-icons";
    "$mod" = "SUPER";
    bind =
      [
        ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
        ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
        ", Caps_Lock, exec, sleep 0.1 && swayosd-client --caps-lock"
        "$mod, Return, exec, $terminal"
        "$mod, C, killactive"
        "$mod, E, exec, $fileManager"
        "$mod, B, exec, $browser"
        "$mod SHIFT, C, exec, hyprpicker | wl-copy"
        "$mod, V, exec, cliphist-rofi-img | rofi -dmenu -display-columns 2 -show-icons | cliphist decode | wl-copy"
        "$mod, Period, exec, rofi -show rofimoji"
        ", XF86Calculator, exec, rofi -show calc"
        "$mod, M, exec, rofi -show rofi-power-menu"
        "$mod SHIFT ,S, exec, grimblast --freeze save area - | swappy -f - && wl-paste | chibi-upload.sh"
        ",Print, exec, grimblast --freeze copy area && wl-paste | chibi-upload.sh"
        "$mod, F, togglefloating"
        "$mod, BRACKETRIGHT, fullscreen"
        "$mod, SPACE, exec, $menu"
        "$mod, J, togglesplit"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod ALT, left, movewindow, l"
        "$mod ALT, right, movewindow, r"
        "$mod ALT, up, movewindow, u"
        "$mod ALT, down, movewindow, d"
        "ALT, F9, exec, sudo gmode.sh"
        "ALT, F9, exec, hyprgamemode.sh"
      ]
      ++ (builtins.concatLists (
        builtins.genList (
          i: let
            ws = i + 1;
          in [
            "$mod, code:1${toString i}, split-workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, split-movetoworkspace, ${toString ws}"
          ]
        )
        5
      ))
      ++ (builtins.concatLists (
        builtins.genList (
          a: let
            i = a + 5;
            ws = i + 1;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        )
        5
      ));
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
}

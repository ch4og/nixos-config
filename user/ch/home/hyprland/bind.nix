{...}: {
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "ghostty";
    "$fileManager" = "thunar";
    "$browser" = "firefox";
    "$menu" = "rofi -show drun -show-icons";
    "$mod" = "SUPER";
    bind =
      [
        ", XF86AudioRaiseVolume, exec, uwsm app -- swayosd-client --output-volume raise"
        ", XF86AudioLowerVolume, exec, uwsm app -- swayosd-client --output-volume lower"
        ", Caps_Lock, exec, uwsm app -- swayosd-client --caps-lock"
        "$mod, Return, exec, uwsm app -- $terminal"
        "$mod, C, killactive"
        "$mod, E, exec, uwsm app -- $fileManager"
        "$mod, B, exec, uwsm app -- $browser"
        "$mod SHIFT, C, exec, uwsm app -- hyprpicker | wl-copy"
        #"$mod, V, exec, uwsm app -- cliphist-rofi-img | rofi -dmenu -display-columns 2 -show-icons | cliphist decode | wl-copy"
        "$mod, V, exec, uwsm app -- copyq show"
        "$mod, Period, exec, uwsm app -- rofi -show rofimoji"
        ", XF86Calculator, exec, uwsm app -- rofi -show calc"
        "$mod, M, exec, uwsm app -- rofi -show rofi-power-menu"
        "$mod SHIFT ,S, exec, uwsm app -- grimblast --freeze save area - | swappy -f - && wl-paste"
        ",Print, exec, uwsm app -- grimblast --freeze copy area && wl-paste"
        "$mod, F, togglefloating"
        "$mod, BRACKETRIGHT, fullscreen"
        "$mod, SPACE, exec, uwsm app -- $menu"
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
      ]
      ++ (builtins.concatLists (
        builtins.genList (
          i: let
            ws = i + 1;
          in [
            "$mod, code:1${toString i}, exec, hyprsome workspace ${toString ws}"
            "$mod SHIFT, code:1${toString i}, exec, hyprsome movefocus ${toString ws}"
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

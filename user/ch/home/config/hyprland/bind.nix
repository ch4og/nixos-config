{ ... }: {
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "kitty";
    "$fileManager" = "kitty lf";
    "$guiFileManager" = "thunar";
    "$browser" = "zen";
    "$menu" = "rofi -show drun";
    "$mod" = "SUPER";
    bind = [
      "$mod, Return, exec, $terminal"
      "$mod, C, killactive"
      "$mod, M, exec, wlogout"
      "$mod, E, exec, $fileManager"
      "$mod SHIFT, E, exec, $guiFileManager"
      "$mod, B, exec, $browser"
      "$mod SHIFT, C, exec, hyprpicker | wl-copy"
      "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
      ''$mod, Period, exec, rofi -modi "emoji:rofimoji" -show emoji''
      "$mod SHIFT ,S, exec, grimblast --freeze save area - | satty --filename - && wl-paste | chibi-upload.sh"
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
    ] ++ (builtins.concatLists (builtins.genList (i:
      let ws = i + 1;
      in [
        "$mod, code:1${toString i}, split-workspace, ${toString ws}"
        "$mod SHIFT, code:1${toString i}, split-movetoworkspace, ${toString ws}"
      ]) 5));
    bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];
  };
}

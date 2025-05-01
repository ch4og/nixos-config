{
  wayland.windowManager.hyprland.settings = let
    terminal = "ghostty";
    fileManager = "yazi";
    browser = "firefox";
    menu = "rofi -show drun -show-icons";
    mod = "SUPER";
    modShift = "${mod} SHIFT";
    modAlt = "${mod} ALT";

    mkBind = mod: key: action: "${mod}, ${key}, ${action}";
    mkExec = cmd: "exec, uwsm app -- ${cmd}";

    mediaBinds = [
      (mkBind "" "XF86AudioRaiseVolume" (mkExec "swayosd-client --output-volume raise"))
      (mkBind "" "XF86AudioLowerVolume" (mkExec "swayosd-client --output-volume lower"))
      (mkBind "" "Caps_Lock" (mkExec "swayosd-client --caps-lock"))
      (mkBind "" "XF86Calculator" (mkExec "rofi -show calc"))
    ];

    appBinds = [
      (mkBind mod "Return" (mkExec terminal))
      (mkBind mod "C" "killactive")
      (mkBind mod "E" (mkExec fileManager))
      (mkBind mod "B" (mkExec browser))
      (mkBind mod "SPACE" (mkExec menu))
    ];

    utilBinds = [
      (mkBind modShift "C" (mkExec "hyprpicker | wl-copy"))
      (mkBind mod "V" (mkExec "copyq show"))
      (mkBind mod "Period" (mkExec "rofi -show rofimoji"))
      (mkBind mod "M" (mkExec "rofi -show rofi-power-menu"))
    ];

    screenshotBinds = [
      (mkBind modShift "S" (mkExec "grimblast --freeze save area - | swappy -f - && wl-paste"))
      (mkBind "" "Print" (mkExec "grimblast --freeze copy area && wl-paste"))
    ];

    windowBinds = [
      (mkBind mod "F" "togglefloating")
      (mkBind mod "BRACKETRIGHT" "fullscreen")
      (mkBind mod "J" "togglesplit")
    ];

    focusBinds = [
      (mkBind mod "left" "movefocus, l")
      (mkBind mod "right" "movefocus, r")
      (mkBind mod "up" "movefocus, u")
      (mkBind mod "down" "movefocus, d")
    ];

    moveBinds = [
      (mkBind modAlt "left" "movewindow, l")
      (mkBind modAlt "right" "movewindow, r")
      (mkBind modAlt "up" "movewindow, u")
      (mkBind modAlt "down" "movewindow, d")
    ];

    specialBinds = [
      (mkBind "ALT" "F9" (mkExec "sudo gmode.sh"))
    ];

    mkWorkspaceBinds = let
      workspaces =
        builtins.genList (i: let
          ws = i + 1;
        in {
          number = ws;
          key = "code:1${toString i}";
        })
        5;
    in
      builtins.concatLists (builtins.map (ws: [
          (mkBind mod ws.key (mkExec "hyprsome workspace ${toString ws.number}"))
          (mkBind modShift ws.key (mkExec "hyprsome movefocus ${toString ws.number}"))
        ])
        workspaces);
  in {
    "$terminal" = terminal;
    "$fileManager" = fileManager;
    "$browser" = browser;
    "$menu" = menu;
    "$mod" = mod;

    bind =
      mediaBinds
      ++ appBinds
      ++ utilBinds
      ++ screenshotBinds
      ++ windowBinds
      ++ focusBinds
      ++ moveBinds
      ++ specialBinds
      ++ mkWorkspaceBinds;

    bindm = [
      (mkBind mod "mouse:272" "movewindow")
      (mkBind mod "mouse:273" "resizewindow")
    ];
  };
}

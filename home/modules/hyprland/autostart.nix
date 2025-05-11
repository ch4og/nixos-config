let
  mkApp = cmd: "uwsm app -- ${cmd}";

  mkWorkspaceApp = workspace: cmd: extraOpts: let
    extraOptsStr =
      if extraOpts != ""
      then "${extraOpts};"
      else "";
  in "[${extraOptsStr}workspace ${toString workspace}] ${mkApp cmd}";
in {
  wayland.windowManager.hyprland.settings.exec-once = [
    (mkApp "waybar")
    (mkApp "copyq")

    "systemctl --user enable --now hyprpolkitagent.service"

    (mkWorkspaceApp 12 "firefox" "")
    (mkWorkspaceApp 14 "ayugram-desktop" "title")
    (mkWorkspaceApp 1 "vesktop --enable-features=WaylandLinuxDrmSyncobj" "title")
    (mkWorkspaceApp 2 "spotify --enable-features=WaylandLinuxDrmSyncobj" "")
    (mkWorkspaceApp 4 "nekobox -tray" "title")
    (mkWorkspaceApp 5 "steam -silent" "title")
  ];
}

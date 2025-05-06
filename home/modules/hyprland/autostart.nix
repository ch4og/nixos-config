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

    (mkWorkspaceApp 24 "ayugram-desktop" "title")
    (mkWorkspaceApp 22 "firefox" "")
    (mkWorkspaceApp 11 "vesktop --enable-features=WaylandLinuxDrmSyncobj" "title")
    (mkWorkspaceApp 12 "spotify --enable-features=WaylandLinuxDrmSyncobj" "")
    (mkWorkspaceApp 14 "nekobox -tray" "title")
    (mkWorkspaceApp 15 "steam -silent" "title")
  ];
}

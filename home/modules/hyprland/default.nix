{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./bind.nix
    ./rules.nix
    ./autostart.nix
    ./portal.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./hyprpaper.nix
  ];
  wayland.windowManager.hyprland = let
    monitors = [
      "DP-1"
      "eDP-1"
      "HDMI-A-1"
    ];
  in {
    enable = true;
    package = pkgs.hyprland-git;
    systemd.enable = false;
    plugins = [
      pkgs.split-monitor-workspaces
    ];
    settings = {
      plugin = {
        split-monitor-workspaces = {
          count = 5;
          keep_focused = 1;
          enable_notifications = 0;
          enable_persistent_workspaces = 1;
        };
      };
      monitor = [
        "${builtins.elemAt monitors 0}, 3840x2160@144, 0x0, 1.875"
        "${builtins.elemAt monitors 1}, 1920x1080@120, 2048x144, 1.25"
        "${builtins.elemAt monitors 2}, 1920x1080@60, auto, 1, mirror, ${builtins.elemAt monitors 0}"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = lib.mkIf (!config.stylix.enable) "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = lib.mkIf (!config.stylix.enable) "rgba(595959aa)";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
          enabled = true;
          color = lib.mkIf (!config.stylix.enable) "rgba(1a1a1aee)";
          render_power = 3;
          range = 4;
        };
        blur = {
          enabled = true;
          size = 5;
          passes = 2;
        };
      };
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        focus_on_activate = true;
        force_default_wallpaper = -1;
        middle_click_paste = false;
        enable_swallow = true;
        swallow_regex = "ghostty";
      };
      input = {
        kb_layout = "us,ru";
        kb_variant = "colemak,";
        kb_options = "grp:alt_shift_toggle,lv3:none";
        follow_mouse = true;
        sensitivity = 0;
      };
      gestures.workspace_swipe = true;
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "NVD_BACKEND,direct"
        "MOZ_ENABLE_WAYLAND,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,gtk3"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "MOZ_DISABLE_RDD_SANDBOX,1"
        "EDITOR,nvim"
        "STEAM_FORCE_DESKTOPUI_SCALING,1.5"
      ];
      cursor = {
        no_hardware_cursors = false;
        use_cpu_buffer = true;
      };
      xwayland = {
        force_zero_scaling = true;
      };
    };
  };
}

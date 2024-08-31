{ config, pkgs, ... }: {
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland-git.default;
    systemd.enable = true;
    systemd.variables = [ "--all" ];
    plugins = [ pkgs.split-monitor-workspaces.default ];
    settings = {
      monitor = [
        "eDP-1, 1920x1080@120, 2048x216, 1.5"
        "HDMI-A-1, 2560x1440@120, 0x0, 1.25"
      ];
      "$terminal" = "kitty";
      "$fileManager" = "thunar";
      "$browser" = "zen";
      "$menu" = "rofi -show drun";

      plugin = {
        "split-monitor-workspaces" = {
          count = 5;
          keep_focused = 0;
          enable_notifications = 0;
          enable_persistent_workspaces = 1;
        };
      };
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
        blur = {
          enabled = true;
          size = 8;
          passes = 3;
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
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };
      input = {
        kb_layout = "us,ru";
        kb_variant = "lang";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = true;
        sensitivity = 0;
      };

      exec-once = [ "waybar" "wl-paste --watch cliphist store" ];
      "$mod" = "SUPER";
      bind = [
        "$mod, Return, exec, $terminal"
        "$mod, C, killactive"
        "$mod, M, exit"
        "$mod, E, exec, $fileManager"
        "$mod, B, exec, $browser"
        "$mod SHIFT, C, exec, hyprpicker"
        "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        ''$mod, Period, exec, rofi -modi "emoji:rofimoji" -show emoji''
        ",Print, exec, grimblast --freeze save area - | satty --filename -"
        "$mod, F, togglefloating"
        "$mod, SPACE, exec, $menu"
        "$mod, J, togglesplit"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, 1, split-workspace, 1"
        "$mod, 2, split-workspace, 2"
        "$mod, 3, split-workspace, 3"
        "$mod, 4, split-workspace, 4"
        "$mod, 5, split-workspace, 5"
        "$mod ALT, left, movewindow, l"
        "$mod ALT, right, movewindow, r"
        "$mod ALT, up, movewindow, u"
        "$mod ALT, down, movewindow, d"
        "$mod SHIFT, 1, split-movetoworkspace, 1"
        "$mod SHIFT, 2, split-movetoworkspace, 2"
        "$mod SHIFT, 3, split-movetoworkspace, 3"
        "$mod SHIFT, 4, split-movetoworkspace, 4"
        "$mod SHIFT, 5, split-movetoworkspace, 5"
      ];
      bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];
      windowrulev2 =
        [ "suppressevent maximize, class:.*" "maximize, title:(satty)" ];
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "NVD_BACKEND,direct"
      ];
      cursor = { no_hardware_cursors = true; };
      xwayland = { force_zero_scaling = true; };

    };
  };
}

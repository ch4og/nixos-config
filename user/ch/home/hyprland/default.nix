{ inputs, pkgs, ... }: {
  imports = [
    ./bind.nix
    ./rules.nix
    ./autostart.nix
    ./portal.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./hyprpaper.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland-git.packages.${pkgs.system}.default;
    systemd.enable = true;
    systemd.variables = [ "--all" ];
    plugins =
      [ inputs.split-monitor-workspaces.packages.${pkgs.system}.default ];
    settings = {
      monitor = [
        "eDP-1, 1920x1080@120, 2048x216, 1.5"
        "HDMI-A-1, 2560x1440@120, 0x0, 1.25"
      ];
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
          size = 6;
          passes = 3;
        };
      };
      layerrule = "blur, waybar";
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
        focus_on_activate = true;
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
        middle_click_paste = false;
      };
      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = true;
        sensitivity = 0;
      };
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "NVD_BACKEND,direct"
        "MOZ_ENABLE_WAYLAND,1"
        "QT_QPA_PLATFORMTHEME,gtk3"
      ];
      cursor = { no_hardware_cursors = false; };
      xwayland = { force_zero_scaling = true; };

    };
  };
}

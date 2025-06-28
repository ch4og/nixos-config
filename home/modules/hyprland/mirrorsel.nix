{pkgs, ...}:
pkgs.writeShellApplication {
  name = "mirrorsel";
  runtimeInputs = [pkgs.hyprland-git pkgs.jq pkgs.rofi-wayland];
  text = ''
    monitors_json=$(hyprctl monitors -j)
    selection=$(echo "$monitors_json" | jq -r '.[] | "\(.make) \(.model) [\(.name)]"' | rofi -dmenu -p "Select monitor to mirror")
    [ -z "$selection" ] && exit 1
    monitor_name=$(echo "$selection" | grep -o '\[.*\]' | tr -d '[]')
    hyprctl keyword monitor "HDMI-A-1, 1920x1080@60, auto, 1, mirror, $monitor_name"
    hyprctl dispatch focusmonitor "$monitor_name"
  '';
}

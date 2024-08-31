{ config, pkgs, ... }:

{
  xdg.configFile."satty/config.toml".text = ''
        [general]
        early-exit = true
        initial-tool = "brush"
    		copy-command = "wl-copy"
        output-filename = "${config.home.homeDirectory}/Pictures/Screenshots/%Y-%m-%d-%H-%M-%S.png"
        primary-highlighter = "block"
        save-after-copy = true
    		disable-notifications = true

        [font]
        family = "Inter"
        style = "Regular"

        [color-palette]
        first = "#88cc88"
        second = "#cc6666"
        third = "#66b2b2"
        fourth = "#ffcc66"
        fifth = "#333333"
        custom = "#ffffff"
  '';
}

{
  config,
  pkgs,
  ...
}: {
  xdg.configFile."lan-mouse/config.toml".text = ''
    release_bind = ["KeyLeftCtrl", "KeyLeftAlt", "KeyLeftShift", "KeyL"]
    port = 4242
    frontend = "cli"

    [left]
    hostname = "winpc.local"
    activate_on_startup = true
    ips = ["10.42.0.253"]
  '';
}

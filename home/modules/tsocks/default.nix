_: {
  xdg.configFile."tsocks.conf".text = ''
    local = 127.0.0.0/255.0.0.0
    local = 192.168.0.0/255.255.0.0
    local = 10.0.0.0/255.0.0.0
    local = 172.16.0.0/255.255.0.0

    server = 127.0.0.1
    server_type = 5
    server_port = 3905
  '';
}

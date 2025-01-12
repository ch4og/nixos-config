{
  creds,
  lib,
  ...
}: {
  type = "shadowsocks";
  tag = "shadowsocks-out";
  server = "${creds.shadowsocks.server}";
  server_port = lib.strings.toInt "${creds.shadowsocks.port}";
  method = "2022-blake3-aes-256-gcm";
  password = "${creds.shadowsocks.password}";
  udp_over_tcp = false;
}

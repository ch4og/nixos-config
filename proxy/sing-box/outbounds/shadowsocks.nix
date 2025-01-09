{creds, ...}: {
  type = "shadowsocks";
  tag = "shadowsocks-out";
  server = "${creds.server}";
  server_port = 80;
  method = "2022-blake3-aes-256-gcm";
  password = "${creds.password}";
  udp_over_tcp = false;
}

{creds, ...}: {
  type = "vless";
  tag = "vless-out";
  server = "${creds.server}";
  server_port = 443;
  uuid = "${creds.uuid}";
  flow = "xtls-rprx-vision";
  network = "tcp";
  tls = {
    enabled = true;
    server_name = "ch4og.com";
    utls = {
      enabled = true;
      fingerprint = "random";
    };
    reality = {
      enabled = true;
      public_key = "${creds.pbkey}";
      short_id = "${creds.sid}";
    };
  };
  domain_strategy = "ipv4_only";
}

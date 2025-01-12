{
  creds,
  lib,
  ...
}: {
  type = "vless";
  tag = "vless-out";
  server = "${creds.vless.server}";
  server_port = lib.strings.toInt "${creds.vless.port}";
  uuid = "${creds.vless.uuid}";
  flow = "xtls-rprx-vision";
  network = "tcp";
  tls = {
    enabled = true;
    server_name = "${creds.vless.domain}";
    utls = {
      enabled = true;
      fingerprint = "chrome";
    };
    reality = {
      enabled = true;
      public_key = "${creds.vless.pbkey}";
      short_id = "${creds.vless.sid}";
    };
  };
  domain_strategy = "ipv4_only";
}

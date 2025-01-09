{creds, ...}: [
  (import ./vless.nix {inherit creds;})
  (import ./shadowsocks.nix {inherit creds;})
  {
    type = "dns";
    tag = "dns-out";
  }
  {
    type = "direct";
    tag = "direct";
  }
  {
    type = "block";
    tag = "block";
  }
]

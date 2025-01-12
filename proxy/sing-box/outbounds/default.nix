{
  creds,
  lib,
  ...
}: [
  (import ./vless.nix {inherit lib creds;})
  (import ./shadowsocks.nix {inherit lib creds;})
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

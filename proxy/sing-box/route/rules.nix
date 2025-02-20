[
  {
    process_name = [
      "electron"
      ".Discord-wrapped"
    ];
    outbound = "shadowsocks-out";
  }
  {
    protocol = "bittorrent";
    outbound = "direct";
  }
  {
    domain_suffix = [
      "2ip.io"
      "myip.wtf"
      "dis.gd"
      "gstatic.com"
      "ggpht.com"
      "ndi.tv"
      "notion.so"
      "animego.me"
      "sovetromantica.com"
    ];
    outbound = "vless-out";
  }
  {
    domain_keyword = [
      "discord"
      "googlevideo"
      "youtu"
      "spotify"
    ];
    outbound = "vless-out";
  }
]

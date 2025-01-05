{
  config,
  pkgs,
  vless,
  nextdns,
  ...
}: {
  services.xray = let
    antizapret = pkgs.fetchurl {
      url = "https://github.com/warexify/antizapret-xray/releases/download/202412141734/antizapret.dat";
      sha256 = "sha256-JwLcLJGB2emov7KI7wcOa/ZCz2rAqEr7OC75rpD++Tg=";
    };
    refilter-geoip = pkgs.fetchurl {
      url = "https://github.com/1andrevich/Re-filter-lists/releases/download/14122024/geoip.dat";
      sha256 = "sha256-BBGRSeNESn98F4/QUY5/d3HshET8wheMoHdiu7rHZ+A=";
    };
    refilter-geosite = pkgs.fetchurl {
      url = "https://github.com/1andrevich/Re-filter-lists/releases/download/14122024/geosite.dat";
      sha256 = "sha256-tOW2DLI4Wum0qcUoFs3rnkAW8XX+sgNIxAZA+0aw3Zk=";
    };
  in {
    enable = true;
    settings = {
      log = {
        loglevel = "error";
      };
      dns = {
        servers = [
          "https://dns.nextdns.io/${nextdns}"
        ];
        tag = "dns-out";
      };

      routing = {
        rules = [
          {
            type = "field";
            protocol = ["bittorrent"];
            outboundTag = "direct";
          }
          {
            type = "field";
            domain = [
              "domain:discord.com"
              "domain:discord.gg"
              "domain:googlevideo"
              "domain:youtube.com"
              "domain:spotify.com"
              "domain:2ip.io"
              "domain:dis.gd"
              "domain:gstatic.com"
              "domain:ggpht.com"
              "domain:ndi.tv"
              "domain:nextdns.io"
            ];
            outboundTag = "vless-out";
          }
          {
            type = "field";
            domains = [
              "ext:../../../../../../../../../${antizapret}:ZAPRETINFO"
            ];
            outboundTag = "vless-out";
          }
          {
            type = "field";
            ip = [
              "ext:../../../../../../../../../${refilter-geoip}:refilter"
            ];
            outboundTag = "vless-out";
          }
          {
            type = "field";
            domain = [
              "ext:../../../../../../../../../${refilter-geosite}:refilter"
            ];
            outboundTag = "vless-out";
          }
        ];
      };

      inbounds = [
        {
          listen = "127.0.0.1";
          port = 1080;
          protocol = "socks";
          settings = {
            auth = "noauth";
            udp = true;
          };
        }
      ];
      outbounds = [
        {
          protocol = "freedom";
          domainStrategy = "UseIP";
          tag = "direct";
        }
        {
          protocol = "vless";
          settings = {
            vnext = [
              {
                port = 443;
                address = "${vless.server}";
                users = [
                  {
                    encryption = "none";
                    flow = "xtls-rprx-vision";
                    id = "${vless.uuid}";
                  }
                ];
              }
            ];
          };
          streamSettings = {
            network = "tcp";
            security = "reality";
            realitySettings = {
              serverName = "ch4og.com";
              fingerprint = "random";
              publicKey = "${vless.pbkey}";
              shortId = "${vless.sid}";
              spiderX = "/";
            };
          };
          tag = "vless-out";
        }
        {
          protocol = "blackhole";
          tag = "block";
        }
      ];
    };
  };
}

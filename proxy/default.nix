{
  config,
  nextdns,
  ...
}: {
  sops.secrets = {
    "vless/server" = {
      restartUnits = ["sing-box.service"];
    };
    "vless/uuid" = {
      restartUnits = ["sing-box.service"];
    };
    "vless/pbkey" = {
      restartUnits = ["sing-box.service"];
    };
    "vless/sid" = {
      restartUnits = ["sing-box.service"];
    };
    "shadowsocks/password" = {
      restartUnits = ["sing-box.service"];
    };
    "shadowsocks/server" = {
      restartUnits = ["sing-box.service"];
    };
  };
  services.sing-box = {
    enable = true;
    settings = {
      log = {
        level = "error";
      };
      dns = {
        servers = [
          {
            tag = "nextdns-direct";
            address = "45.90.28.29";
            detour = "vless-out";
          }
          {
            tag = "nextdns";
            address = "https://dns.nextdns.io/${nextdns}";
            address_resolver = "nextdns-direct";
            address_strategy = "ipv4_only";
            detour = "vless-out";
          }
          {
            tag = "block";
            address = "rcode://success";
          }
        ];
        final = "nextdns";
        strategy = "ipv4_only";
        disable_cache = false;
        disable_expire = false;
      };
      inbounds = [
        {
          type = "tun";
          tag = "tun-in";
          interface_name = "sing0";
          inet4_address = "172.19.0.1/28";
          auto_route = true;
          sniff = true;
          domain_strategy = "ipv4_only";
        }
      ];

      outbounds = [
        {
          type = "vless";
          tag = "vless-out";
          server._secret = "${config.sops.secrets."vless/server".path}";
          server_port = 443;
          uuid._secret = "${config.sops.secrets."vless/uuid".path}";
          flow = "xtls-rprx-vision";
          network = "tcp";
          tls = {
            enabled = true;
            insecure = false;
            server_name = "ch4og.com";
            utls = {
              enabled = true;
              fingerprint = "random";
            };
            reality = {
              enabled = true;
              public_key._secret = "${config.sops.secrets."vless/pbkey".path}";
              short_id._secret = "${config.sops.secrets."vless/sid".path}";
            };
          };
          domain_strategy = "ipv4_only";
        }
        {
          type = "shadowsocks";
          tag = "shadowsocks-out";
          server._secret = "${config.sops.secrets."shadowsocks/server".path}";
          server_port = 80;
          method = "2022-blake3-aes-256-gcm";
          password._secret = "${config.sops.secrets."shadowsocks/password".path}";
          udp_over_tcp = false;
        }
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
      ];
      route = {
        rule_set = [
          {
            tag = "antizapret";
            type = "remote";
            format = "binary";
            url = "https://github.com/savely-krasovsky/antizapret-sing-box/releases/latest/download/antizapret.srs";
            download_detour = "vless-out";
          }
          {
            tag = "refilter_domains";
            type = "remote";
            format = "binary";
            url = "https://github.com/1andrevich/Re-filter-lists/releases/latest/download/ruleset-domain-refilter_domains.srs";
            download_detour = "vless-out";
          }
          {
            tag = "refilter_ipsum";
            type = "remote";
            format = "binary";
            url = "https://github.com/1andrevich/Re-filter-lists/releases/latest/download/ruleset-ip-refilter_ipsum.srs";
            download_detour = "vless-out";
          }
        ];
        rules = [
          {
            process_name = [
              "electron"
              ".Discord-wrapped"
              ".DiscordCanary-wrapped"
            ];
            outbound = "shadowsocks-out";
          }
          {
            domain_suffix = [
              "2ip.io" # for testing that it works
              "dis.gd"
              "gstatic.com"
              "ggpht.com"
            ];
            outbound = "vless-out";
          }
          {
            domain_keyword = [
              "discord"
              "google"
              "duckduckgo"
              "youtu"
              "spotify"
            ];
            outbound = "vless-out";
          }
          {
            protocol = "bittorrent";
            outbound = "direct";
          }
          {
            rule_set = "antizapret";
            outbound = "vless-out";
          }
          {
            rule_set = "refilter_domains";
            outbound = "vless-out";
          }
          {
            rule_set = "refilter_ipsum";
            outbound = "vless-out";
          }
        ];
        final = "direct";
        auto_detect_interface = true;
      };
    };
  };
}

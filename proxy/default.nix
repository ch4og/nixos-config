{
  config,
  nextdns,
  ...
}: {
  sops.secrets = {
    "sing_box/server" = {
      restartUnits = ["sing-box.service"];
    };
    "sing_box/uuid" = {
      restartUnits = ["sing-box.service"];
    };
    "sing_box/pbkey" = {
      restartUnits = ["sing-box.service"];
    };
    "sing_box/sid" = {
      restartUnits = ["sing-box.service"];
    };
  };
  services.sing-box = {
    enable = true;
    settings = {
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
            address_strategy = "prefer_ipv4";
            detour = "vless-out";
          }
          {
            tag = "block";
            address = "rcode://success";
          }
        ];
        final = "nextdns";
        strategy = "prefer_ipv4";
        disable_cache = false;
        disable_expire = false;
      };
      inbounds = [
        {
          type = "http";
          tag = "http-in";
          listen = "::";
          listen_port = 5353;
          domain_strategy = "prefer_ipv4";
        }
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
          server._secret = "${config.sops.secrets."sing_box/server".path}";
          server_port = 443;
          uuid._secret = "${config.sops.secrets."sing_box/uuid".path}";
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
              public_key._secret = "${config.sops.secrets."sing_box/pbkey".path}";
              short_id._secret = "${config.sops.secrets."sing_box/sid".path}";
            };
          };
          domain_strategy = "prefer_ipv4";
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
            domain_suffix = builtins.filter (x: x != "" && x != []) (
              builtins.split "\n" (builtins.readFile ./blocked-extra.txt)
            );
            outbound = "vless-out";
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
          {
            process_name = [
              "electron"
              ".Discord-wrapped"
            ];
            outbound = "vless-out";
          }
        ];
        final = "direct";
        auto_detect_interface = true;
      };
    };
  };
  # networking.proxy.default = "http://127.0.0.1:5353";
  programs.proxychains = {
    enable = true;
    proxies = {
      sing-box = {
        enable = true;
        type = "http";
        host = "127.0.0.1";
        port = 5353;
      };
    };
  };
}

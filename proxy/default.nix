{ config, ... }: {
  sops.secrets = {
    "sing_box/server" = { restartUnits = [ "sing-box.service" ]; };
    "sing_box/uuid" = { restartUnits = [ "sing-box.service" ]; };
    "sing_box/pbkey" = { restartUnits = [ "sing-box.service" ]; };
    "sing_box/sid" = { restartUnits = [ "sing-box.service" ]; };
  };
  services.sing-box = {
    enable = true;
    settings = {
      "dns" = {
        "servers" = [
          {
            "tag" = "google";
            "address" = "https://8.8.8.8/dns-query";
            "detour" = "vless-out";
          }
          {
            "tag" = "block";
            "address" = "rcode://success";
          }
        ];
        "final" = "google";
        "strategy" = "prefer_ipv4";
        "disable_cache" = false;
        "disable_expire" = false;
      };
      "inbounds" = [
        {
          type = "http";
          tag = "http-in";
          listen = "::";
          listen_port = 5353;
        }
      ];

      "outbounds" = [
        {
          "type" = "vless";
          "tag" = "vless-out";
          server._secret = "${config.sops.secrets."sing_box/server".path}";
          "server_port" = 443;
          uuid._secret = "${config.sops.secrets."sing_box/uuid".path}";
          "flow" = "xtls-rprx-vision";
          "network" = "tcp";
          "tls" = {
            "enabled" = true;
            "insecure" = false;
            "server_name" = "ch4og.com";
            "utls" = {
              "enabled" = true;
              "fingerprint" = "random";
            };
            "reality" = {
              "enabled" = true;
              public_key._secret = "${config.sops.secrets."sing_box/pbkey".path}";
              short_id._secret = "${config.sops.secrets."sing_box/sid".path}";
            };
          };
        }
        {
          "type" = "dns";
          "tag" = "dns-out";
        }
        {
          "type" = "direct";
          "tag" = "direct";
        }
        {
          "type" = "block";
          "tag" = "block";
        }
      ];
      "route" = {
        "geoip" = {
          "path" = "/tmp/geoip.db";
          "download_url" = "https://github.com/SagerNet/sing-geoip/releases/latest/download/geoip.db";
          "download_detour" = "vless-out";
        };
        "geosite" = {
          "path" = "/tmp/geosite.db";
          "download_url" = "https://github.com/SagerNet/sing-geosite/releases/latest/download/geosite.db";
          "download_detour" = "vless-out";
        };
        "rules" = [
          {
            "domain" = [ ];
            "domain_keyword" = [ ];
            "domain_regex" = [ ];
            "domain_suffix" =
              builtins.filter (x: x != "" && x != [ ]) (builtins.split "\n" (builtins.readFile ./blocked-discord.txt + builtins.readFile ./blocked-youtube.txt));
            "geosite" = [ ];
            "outbound" = "vless-out";
          }
          {
            "geosite" = [ "private" "youtube" "google" "yandex" ];
            "geoip" = [ "private" "ru" ];
            "ip_cidr" = [ "94.100.180.201/32" "94.100.180.202/32" ];
            "domain_keyword" = [ "mail.ru" "vk.com" ];
            "domain_suffix" = [ ".ru" ];
            "outbound" = "direct";
          }
        ];
        "final" = "vless-out";
        "auto_detect_interface" = true;
      };
    };
  };
  networking.proxy.default = "http://127.0.0.1:5353";
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

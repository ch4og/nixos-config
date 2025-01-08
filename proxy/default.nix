{
  config,
  pkgs,
  ...
}: let
  creds = builtins.extraBuiltins.readSops ./creds.nix.enc;
in {
  services.sing-box = let
    rules = rec {
      full = pkgs.fetchzip {
        url = "https://github.com/runetfreedom/russia-v2ray-rules-dat/releases/download/202501090938/sing-box.zip";
        hash = "sha256-+Gp+ByCgzmHnK/GXAbFeXYc4hCzu8Atbw+et1xFlkFc=";
        stripRoot = false;
      };
      geoip = full + "/rule-set-geoip";
      geosite = full + "/rule-set-geosite";
    };
    ruleSets = [
      "geoip-ru-blocked"
      "geoip-ru-blocked-community"
      "geoip-re-filter"
      "geosite-ru-blocked"
    ];
  in {
    enable = true;
    settings = {
      log.level = "error";
      dns = {
        servers = [
          {
            tag = "nextdns-direct";
            address = "45.90.28.29";
            detour = "vless-out";
          }
          {
            tag = "nextdns";
            address = "https://dns.nextdns.io/${creds.nextdns}";
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
        disable_cache = true;
        disable_expire = false;
      };
      inbounds = [
        {
          type = "tun";
          tag = "tun-in";
          interface_name = "sing0";
          address = ["172.19.0.1/28"];
          mtu = 9000;
          auto_route = true;
          strict_route = false;
          stack = "gvisor";
          endpoint_independent_nat = true;
          sniff = true;
          sniff_override_destination = true;
        }
      ];
      outbounds = [
        {
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
        {
          type = "shadowsocks";
          tag = "shadowsocks-out";
          server = "${creds.server}";
          server_port = 80;
          method = "2022-blake3-aes-256-gcm";
          password = "${creds.password}";
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
        rule_set = let
          paths =
            builtins.map (
              ruleSet:
                if builtins.match "^geoip" ruleSet != null
                then "${rules.geoip}/${ruleSet}.srs"
                else if builtins.match "^geosite" ruleSet != null
                then "${rules.geosite}/${ruleSet}.srs"
                else null
            )
            ruleSets;

          generateConfig = path: {
            tag = builtins.replaceStrings ["${rules.geoip}/" "${rules.geosite}/" ".srs"] ["" "" ""] (builtins.baseNameOf path);
            type = "local";
            format = "binary";
            path = path;
          };
        in
          builtins.map generateConfig paths;
        rules =
          [
            {
              rule_set = "geosite-category-ads-all";
              outbound = "block";
            }
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
                "2ip.io"
                "myip.wtf"
                "dis.gd"
                "gstatic.com"
                "ggpht.com"
                "ndi.tv"
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
            {
              protocol = "bittorrent";
              outbound = "direct";
            }
          ]
          ++ builtins.map (ruleSet: {
            rule_set = ruleSet;
            outbound = "vless-out";
          })
          ruleSets;
        final = "direct";
        auto_detect_interface = true;
      };
    };
  };
}

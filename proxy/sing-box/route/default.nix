{pkgs, ...}: let
  rules = rec {
    full = pkgs.fetchzip {
      url = "https://github.com/runetfreedom/russia-v2ray-rules-dat/releases/download/202501090938/sing-box.zip";
      hash = "sha256-+Gp+ByCgzmHnK/GXAbFeXYc4hCzu8Atbw+et1xFlkFc=";
      stripRoot = false;
    };
    geoip = full + "/rule-set-geoip";
    geosite = full + "/rule-set-geosite";
    sets = [
      "geoip-ru-blocked"
      "geoip-ru-blocked-community"
      "geoip-re-filter"
      "geosite-ru-blocked"
    ];
  };
in {
  rule_set =
    builtins.map (path: {
      tag =
        builtins.replaceStrings
        ["${rules.geoip}/" "${rules.geosite}/" ".srs"]
        ["" "" ""]
        (builtins.baseNameOf path);
      type = "local";
      format = "binary";
      inherit path;
    }) (builtins.map (
        ruleSet:
          if builtins.match "^geoip.*" ruleSet != null
          then "${rules.geoip}/${ruleSet}.srs"
          else if builtins.match "^geosite.*" ruleSet != null
          then "${rules.geosite}/${ruleSet}.srs"
          else null
      )
      rules.sets);
  rules =
    (import ./rules.nix)
    ++ builtins.map (ruleSet: {
      rule_set = ruleSet;
      outbound = "vless-out";
    })
    rules.sets;
  final = "direct";
  auto_detect_interface = true;
}

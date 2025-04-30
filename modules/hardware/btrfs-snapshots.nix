{lib, ...}: {
  services.snapper = {
    configs = let
      commonConfig = {
        ALLOW_GROUPS = ["wheel"];
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;
        TIMELINE_MIN_AGE = 1800;
        TIMELINE_LIMIT_HOURLY = 5;
        TIMELINE_LIMIT_DAILY = 7;
        TIMELINE_LIMIT_WEEKLY = 2;
        TIMELINE_LIMIT_MONTHLY = 0;
        TIMELINE_LIMIT_YEARLY = 0;
        BACKGROUND_COMPARISON = "yes";
        NUMBER_CLEANUP = "no";
        EMPTY_PRE_POST_CLEANUP = "yes";
        EMPTY_PRE_POST_MIN_AGE = "1800";
      };
    in {
      home = lib.mkMerge [
        commonConfig
        {SUBVOLUME = "/home";}
      ];

      root = lib.mkMerge [
        commonConfig
        {SUBVOLUME = "/";}
      ];

      nix = lib.mkMerge [
        commonConfig
        {SUBVOLUME = "/nix";}
      ];

      log = lib.mkMerge [
        commonConfig
        {SUBVOLUME = "/var/log";}
      ];

      games = lib.mkMerge [
        commonConfig
        {SUBVOLUME = "/home/ch/Games";}
      ];
    };

    snapshotInterval = "hourly";
    cleanupInterval = "1d";
  };
}

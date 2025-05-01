{pkgs, ...}: {
  xdg.desktopEntries = let
    createEntry = {
      name,
      genericName,
      icon,
      exec,
      categories,
      mimeType ? [],
    }: {
      inherit name;
      inherit genericName;
      inherit icon;
      inherit exec;
      type = "Application";
      inherit categories;
      inherit mimeType;
    };
  in {
    "discord" = createEntry {
      name = "Discord";
      genericName = "All-in-one cross-platform voice and text chat for gamers";
      icon = "discord";
      exec = "${pkgs.lib.getExe pkgs.discord} %U --enable-features=WaylandLinuxDrmSyncobj";
      categories = ["Network" "InstantMessaging"];
      mimeType = ["x-scheme-handler/discord"];
    };
    "vesktop" = createEntry {
      name = "Vesktop";
      genericName = "Internet Messenger";
      icon = "vesktop";
      exec = "${pkgs.lib.getExe pkgs.vesktop} %U --enable-features=WaylandLinuxDrmSyncobj";
      categories = ["Network" "InstantMessaging" "Chat"];
    };
    "spotify" = createEntry {
      name = "Spotify";
      genericName = "Music Player";
      icon = "spotify";
      exec = "${pkgs.lib.getExe pkgs.spotify} %U --enable-features=WaylandLinuxDrmSyncobj";
      categories = ["Audio" "Music" "Player" "AudioVideo"];
      mimeType = ["x-scheme-handler/spotify"];
    };
  };
}

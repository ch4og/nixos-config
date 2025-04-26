{
  xdg.desktopEntries = {
    "discord" = {
      categories = [
        "Network"
        "InstantMessaging"
      ];
      exec = "Discord --enable-features=WaylandLinuxDrmSyncobj";
      name = "Discord";
      genericName = "All-in-one cross-platform voice and text chat for gamers";
      icon = "discord";
      type = "Application";
      mimeType = ["x-scheme-handler/discord"];
    };
    "vesktop" = {
      categories = [
        "Network"
        "InstantMessaging"
        "Chat"
      ];
      exec = "vesktop %U --enable-features=WaylandLinuxDrmSyncobj";
      genericName = "Internet Messenger";
      icon = "vesktop";
      name = "Vesktop";
      type = "Application";
    };
    "spotify" = {
      categories = [
        "Audio"
        "Music"
        "Player"
        "AudioVideo"
      ];
      exec = "spotify %U --enable-features=WaylandLinuxDrmSyncobj";
      name = "Spotify";
      genericName = "Music Player";
      icon = "spotify";
      type = "Application";
      mimeType = ["x-scheme-handler/spotify"];
    };
  };
}

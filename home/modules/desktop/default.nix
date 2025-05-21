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
    "yazi" = createEntry {
      name = "Yazi";
      genericName = "Yazi";
      icon = "yazi";
      exec = "${pkgs.lib.getExe pkgs.ghostty} -e ${pkgs.lib.getExe pkgs.yazi}";
      categories = ["Utility" "Core" "System" "FileTools" "FileManager"];
      mimeType = ["inode/directory"];
    };
  };
}

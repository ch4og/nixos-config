{
  xdg.desktopEntries = {
    "discord-canary" = {
      categories = [
        "Network"
        "InstantMessaging"
      ];
      exec = "DiscordCanary --disable-gpu-compositing";
      name = "Discord Canary";
      genericName = "All-in-one cross-platform voice and text chat for gamers";
      icon = "discord-canary";
      type = "Application";
      mimeType = ["x-scheme-handler/discord"];
    };
    "vesktop" = {
      categories = [
        "Network"
        "InstantMessaging"
        "Chat"
      ];
      exec = "vesktop %U --disable-gpu-compositing";
      genericName = "Internet Messenger";
      icon = "vesktop";
      name = "Vesktop";
      type = "Application";
    };
  };
}

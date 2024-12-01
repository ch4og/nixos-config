{
  xdg.desktopEntries = {
    "org.telegram.desktop" = {
      name = "Telegram Desktop";
      comment = "Official desktop version of Telegram messaging app";
      exec = "env QT_QPA_PLATFORM=xcb telegram-desktop -- %u";
      icon = "telegram";
      terminal = false;
      type = "Application";
      categories = [
        "Chat"
        "Network"
        "InstantMessaging"
        "Qt"
      ];
      mimeType = ["x-scheme-handler/tg"];
    };
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

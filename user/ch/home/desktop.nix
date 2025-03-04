{
  xdg.desktopEntries = {
    "discord" = {
      categories = [
        "Network"
        "InstantMessaging"
      ];
      exec = "Discord --disable-gpu-compositing";
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
      exec = "vesktop %U --disable-gpu-compositing";
      genericName = "Internet Messenger";
      icon = "vesktop";
      name = "Vesktop";
      type = "Application";
    };
    "com.ayugram.desktop" = {
      categories = [
        "Chat"
        "Network"
        "InstantMessaging"
        "Qt"
      ];
      exec = "env QT_QPA_PLATFORM=xcb ayugram-desktop";
      name = "AyuGram Desktop";
      genericName = "AyuGram Desktop";
      icon = "ayugram";
      type = "Application";
    };
  };
}

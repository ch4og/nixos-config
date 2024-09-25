{
  xdg.desktopEntries = {
    "org.telegram.desktop" = {
      name = "Telegram Desktop";
      comment = "Official desktop version of Telegram messaging app";
      exec = "env QT_QPA_PLATFORM=xcb telegram-desktop -- %u";
      icon = "telegram";
      terminal = false;
      type = "Application";
      categories = [ "Chat" "Network" "InstantMessaging" "Qt" ];
      mimeType = [ "x-scheme-handler/tg" ];
    };
  };
}

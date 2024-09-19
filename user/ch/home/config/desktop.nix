{
  xdg.desktopEntries = {
    "io.github.tdesktop_x64.TDesktop" = {
      name = "64Gram Desktop";
      comment = "Unofficial desktop version of Telegram messaging app";
      exec = "env QT_QPA_PLATFORM=xcb telegram-desktop -- %u";
      icon = "telegram";
      terminal = false;
      type = "Application";
      categories = [ "Chat" "Network" "InstantMessaging" "Qt" ];
      mimeType = [ "x-scheme-handler/tg" ];
    };
  };
}

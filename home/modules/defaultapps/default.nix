{
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "ghostty";
  };

  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/json" = "firefox.desktop";
        "application/pdf" = "firefox.desktop";
        "application/x-xpinstall" = "firefox.desktop";
        "application/xhtml+xml" = "firefox.desktop";
        "text/html" = "firefox.desktop";
        "text/xml" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "inode/directory" = "yazi.desktop";
        "image/jpeg" = "org.gnome.eog.desktop";
        "image/png" = "org.gnome.eog.desktop";
        "image/svg+xml" = "org.gnome.eog.desktop";
        "x-scheme-handler/tg" = "com.ayugram.desktop.desktop";
        "x-scheme-handler/tonsite" = "com.ayugram.desktop.desktop";
      };
    };
    configFile."mimeapps.list".force = true;
  };
}

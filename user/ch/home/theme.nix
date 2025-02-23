{
  config,
  pkgs,
  ...
}: {
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  gtk = {
    enable = true;

    font.name = "Noto Sans";
    theme = {
      package = pkgs.layan-gtk-theme;
      name = "Layan-Dark";
    };

    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-dark";
    };
  };

  xdg.configFile = {
    "Kvantum/Layan/Layan.kvconfig".source = "${pkgs.layan-kde}/share/Kvantum/Layan/Layan.kvconfig";
    "Kvantum/Layan/Layan.svg".source = "${pkgs.layan-kde}/share/Kvantum/Layan/Layan.svg";
    "Kvantum/Layan/LayanDark.kvconfig".source = "${pkgs.layan-kde}/share/Kvantum/Layan/LayanDark.kvconfig";
    "Kvantum/Layan/LayanDark.svg".source = "${pkgs.layan-kde}/share/Kvantum/Layan/LayanDark.svg";
    "Kvantum/LayanSolid/LayanSolid.kvconfig".source = "${pkgs.layan-kde}/share/Kvantum/LayanSolid/LayanSolid.kvconfig";
    "Kvantum/LayanSolid/LayanSolid.svg".source = "${pkgs.layan-kde}/share/Kvantum/LayanSolid/LayanSolid.svg";
    "Kvantum/LayanSolid/LayanSolidDark.kvconfig".source = "${pkgs.layan-kde}/share/Kvantum/LayanSolid/LayanSolidDark.kvconfig";
    "Kvantum/LayanSolid/LayanSolidDark.svg".source = "${pkgs.layan-kde}/share/Kvantum/LayanSolid/LayanSolidDark.svg";
  };

  xdg.configFile."Kvantum/kvantum.kvconfig".source =
    (pkgs.formats.ini {}).generate "kvantum.kvconfig"
    {
      General.theme = "LayanSolidDark";
    };
}

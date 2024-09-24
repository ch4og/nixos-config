{ pkgs, ... }: {
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.configFile."xdg-desktop-portal/portals.conf".text = ''
    [preferred]
    default=hyprland;gtk
    org.freedesktop.impl.portal.FileChooser = gtk
  '';
}

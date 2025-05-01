_: {
  security = {
    polkit.enable = true;
    pam.services.sddm.enableGnomeKeyring = true;

    sudo.execWheelOnly = true;

    rtkit.enable = true;
  };

  services.gnome.gnome-keyring.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false;
    settings.default-cache-ttl = 4 * 60 * 60;
  };
}

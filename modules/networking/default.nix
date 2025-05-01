_: {
  networking = {
    networkmanager.enable = true;
    firewall.enable = false;
  };

  systemd.services.NetworkManager-wait-online.enable = false;

  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
      };
      allowSFTP = true;
    };

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      publish = {
        enable = true;
        userServices = true;
        addresses = true;
      };
    };

    usbmuxd.enable = true;
  };
}

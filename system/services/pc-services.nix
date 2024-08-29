{ config, lib, pkgs, ... }: {
  services = {
    openssh.enable = true;

    xserver = {
    #  enable = true;
			videoDrivers = [ "nvidia" ];
    };
   desktopManager.cosmic.enable = true;
   displayManager.cosmic-greeter.enable = true;
  };
}

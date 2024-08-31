{ config, lib, pkgs, ... }: {
  services = {
    openssh.enable = true;

    blueman.enable = true;
    xserver = {
      # enable = true;
      videoDrivers = [ "nvidia" ];
    };
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };
}

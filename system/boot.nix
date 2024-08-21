{ config, lib, pkgs, ... }: {
  boot = {
    loader.grub = {
      device = "nodev";
      efiSupport = true;
    };
    loader.efi.canTouchEfiVariables = true;

    tmp.cleanOnBoot = true;

    kernelPackages = pkgs.linuxPackages_zen;
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
      acpi_call
      xpadneo
    ];
  };
}

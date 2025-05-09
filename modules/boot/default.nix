{
  config,
  pkgs,
  ...
}: {
  boot = {
    loader = {
      grub = {
        device = "nodev";
        efiSupport = true;
      };
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_zen;

    kernelModules = [
      "vfio-pci"
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];

    kernelParams = [
      "amd_iommu=on"
      "iommu=pt"
      "nvidia.NVreg_UsePageAttributeTable=1"
      "mitigations=off"
      "acpi_osi=Linux-Dell-Video"
    ];

    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
      acpi_call
      xpadneo
    ];

    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';

    blacklistedKernelModules = ["nouveau"];

    supportedFilesystems = ["ntfs"];

    tmp.cleanOnBoot = true;
  };

  powerManagement.cpuFreqGovernor = "performance";
}

{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-gaming.nixosModules.pipewireLowLatency
  ];

  services = {
    blueman.enable = true;

    xserver.videoDrivers = ["nvidia"];
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      settings = {
        Autologin = {
          User = "ch";
          Session = "hyprland-uwsm.desktop";
        };
      };
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      lowLatency.enable = true;
    };

    locate = {
      enable = true;
      package = pkgs.plocate;
      interval = "daily";
    };

    scx = {
      enable = true;
      package = pkgs.scx.full;
      scheduler = "scx_rusty";
    };

    xserver = {
      xkb.layout = "us,ru";
      xkb.options = "grp:alt_shift_toggle";
    };
  };

  programs = {
    hyprland = {
      package = pkgs.hyprland-git;
      withUWSM = true;
    };

    gamemode = {
      enable = true;
      settings = {
        general = {
          renice = 10;
          softrealtime = "auto";
          inhibit_screensaver = 1;
        };
        gpu = {
          apply_gpu_optimisations = "accept-responsibility";
          gpu_device = 0;
          amd_performance_level = "high";
        };
        custom = {
          start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
          end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
        };
      };
    };

    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 4d --keep 3";
      };
      flake = "/home/ch/Code/Nix/nixos-config";
    };
  };
}

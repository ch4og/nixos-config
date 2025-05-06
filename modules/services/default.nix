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

    samba = {
      enable = true;
      settings = {
        global = {
          "workgroup" = "WORKGROUP";
          "server string" = "nixpc";
          "netbios name" = "nixpc";
          "security" = "user";
          "guest account" = "nobody";
        };
        "share" = {
          "path" = "/home/ch/Share";
          "browsable" = "yes";
          "read only" = "no";
          "guest ok" = "no";
          "create mask" = "0644";
          "directory mask" = "0755";
        };
      };
    };
    samba-wsdd.enable = true;
  };

  programs = {
    dconf.enable = true;
    steam = {
      enable = true;
      extraCompatPackages = [pkgs.proton-ge-bin];
    };

    hyprland = {
      enable = true;
      package = pkgs.hyprland;
      withUWSM = true;
    };

    gamemode = {
      enable = true;
      enableRenice = true;
      settings = {
        general = {
          desiredgov = "performance";
          desiredprof = "performance"; # for some reason this is not working
          renice = 10;
          softrealtime = "auto";
          inhibit_screensaver = 1;
        };
        custom = {
          start = ''
            echo performance > /sys/firmware/acpi/platform_profile
            ${pkgs.libnotify}/bin/notify-send "GameMode started"
          '';
          stop = ''
            echo balanced > /sys/firmware/acpi/platform_profile
            ${pkgs.libnotify}/bin/notify-send "GameMode stopped"
          '';
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

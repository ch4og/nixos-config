# NixOS Configuration

![image](./assets/screenshot.png)

This repository contains my personal NixOS configuration with a modular structure.

> [!WARNING]
> While this is my daily driver on my main machine, the configuration is still WIP.

## Structure

The configuration is organized as follows:

```
nixos-config/
├── flake.nix                # Main flake configuration
├── hosts/                   # Host-specific configurations
│   └── nixpc/               # Configuration for my main PC
├── modules/                 # Modular configuration components
│   ├── boot/                # Boot and kernel configuration
│   ├── hardware/            # Hardware-specific settings
│   ├── networking/          # Network configuration with secure firewall
│   ├── security/            # Security-related settings
│   └── services/            # System services including gaming optimizations
├── home/                    # Home Manager configurations
│   ├── hyprland/            # Hyprland compositor configuration
│   ├── waybar/              # Waybar status bar configuration
│   ├── fish/                # Fish shell configuration
│   ├── packages/            # User packages organized by category
│   └── ...                  # Other home configurations
├── generic/                 # Generic configurations
└── user/                    # User-specific settings
```

## Acknowledgments

This configuration was inspired by:
- [Gylvaris/nix-config](https://github.com/Gylvaris/nix-config) (Never would try NixOS without him!)
- [s0me1newithhand7s/myNixConf](https://github.com/s0me1newithhand7s/myNixConf)
- [krypt0nn/dotfiles](https://github.com/krypt0nn/dotfiles)
- [TheMaxMur/NixOS-Configuration](https://github.com/TheMaxMur/NixOS-Configuration)
- [s0me1newithhand7s/reNixOS](https://github.com/s0me1newithhand7s/reNixos)
- [romek-codes/nix-config](https://github.com/romek-codes/nix-config)
- [Sk7Str1p3/dotFiles](https://github.com/Sk7Str1p3/dotFiles)

Big thanks to all of these amazing people!


# My NixOS config

![image](https://github.com/user-attachments/assets/d6580f04-0787-4c98-af09-87baa21eac7d)

TODO:

System:

- [ ] Setup btrfs snapshots with snapper
- [ ] Switch to [agenix](https://github.com/ryantm/agenix) for better secrets
      management

VMs:

- [ ] Remove useless lines from
      [windows-gpu.xml](https://github.com/ch4og/nixos-config/blob/main/vm/windows-gpu/windows-gpu.xml)
- [ ] Bliss OS VM

Desktop:

- [ ] Add Adwaita theme for GTK and QT (or any other uniform theme)
- [ ] SDDM theme
- [ ] Use [Stylix](https://github.com/danth/stylix) for theming?
- [x] Switch to hyprsplit cause it works better in my use case

Proxy:

- [ ] Find why sometimes network dies and drops packets
- [ ] Switch to xray or v2ray maybe?
- [x] Add rules to bypass discord block
- [x] Configure rules to proxy only blocked sites
- [x] Create a [flake for byedpi](https://github.com/ch4og/byedpi-flake)

Tools:

- [x] Create [env for cybersecurity](https://github.com/ch4og/nixcybersec)
- [x] Switch to nvf from nixvim. [config](https://github.com/ch4og/nvf)

Long term:

- [ ] Setup Pi-hole on NixOS on RPi
- [ ] Switch all servers from Debian to NixOS

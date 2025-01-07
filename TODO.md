# TODO:

### General:

- [ ] Make README prettier
- [ ] Add more documentation
- [ ] Refactor and restructure code

### System:

- [ ] Setup btrfs snapshots with snapper
- [?] Switch to [agenix](https://github.com/ryantm/agenix) for better secrets
  management (mb current sops realisation will be good enough)
- [ ] Add system service that runs nh clean.
- [ ] Make justfile more functional

### VMs:

- [ ] Remove useless lines from
      [windows-gpu.xml](https://github.com/ch4og/nixos-config/blob/main/vm/windows-gpu/windows-gpu.xml)
- [ ] Bliss OS VM

### Desktop:

- [ ] Add Adwaita theme for GTK and QT (or any other uniform theme)
- [ ] SDDM theme
- [ ] Use [Stylix](https://github.com/danth/stylix) for theming?
- [ ] Switch to hyprpanel

### Proxy:

- [ ] Find why sometimes network dies and drops packets

### Tools:

- [x] Create [env for cybersecurity](https://github.com/ch4og/nixcybersec)
- [x] Switch to nvf from nixvim. [config](https://github.com/ch4og/nvf)

### Long term:

- [ ] Setup Pi-hole on NixOS on RPi

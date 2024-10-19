# list all available commands
default:
	@just --list

# add files to git
prebuild:
  cp /etc/nixos/hardware-configuration.nix system/hardware-configuration.nix
  nix shell nixpkgs#sops -c true
  sudo mkdir -p /root/.config
  sudo cp ~/.config/sops /root/.config -r
  git add .

# nixos-rebuild switch
switch: prebuild
	sudo nixos-rebuild switch --flake .

# nix flake update
update:
	nix flake update

# nixos-rebuild boot
boot: prebuild
	sudo nixos-rebuild boot --flake .

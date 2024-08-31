# list all available commands
default:
	@just --list

# format nix files and add them to git
prebuild:
	nixfmt .
	cp /etc/nixos/hardware-configuration.nix system/hardware/hardware-configuration.nix
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

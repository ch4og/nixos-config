set shell := ["nix", "develop", ".", "--command", "bash", "-c"]

# list all available commands
default:
	@just --list

# all prebuild commands
pre:
  git add .

# rebuild and switch
sw: pre
  cp /etc/nixos/hardware-configuration.nix hosts/hardware-configuration.nix
  nh os switch .

# update all deps
up:
	nix flake update

# update a single dep
upp input:
  nix flake update {{input}}

# nixos-rebuild boot
boot: pre
  cp /etc/nixos/hardware-configuration.nix hosts/hardware-configuration.nix
  nh os boot .

# garbage collect
gc:
  nh clean all -K 3d

# switch home-manager config
hm: pre
  nh home switch .

ss:
  grim -g "0,0 2048x1152" assets/screenshot.png

statix:
  statix check -i hosts/hardware-configuration.nix

deadnix:
  deadnix --exclude hosts/hardware-configuration.nix

fmt:
  nix fmt .

fix:
  nix develop .#fix

set shell := ["nix-shell", "-p", "sops", "nh", "--run"]

# list all available commands
default:
	@just --list

# all prebuild commands
pre:
  cp /etc/nixos/hardware-configuration.nix system/hardware-configuration.nix
  git add .

# rebuild and switch
sw: pre
  nh os switch .

# update all deps
up:
	nix flake update

# update a single dep
upp input:
  nix flake update {{input}}

# nixos-rebuild boot
boot: pre
  nh os boot .

# garbage collect
gc:
  nh clean all -K 3d

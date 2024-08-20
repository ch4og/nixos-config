#!/bin/sh
set -e

echo Warning! This will overwrite system/hardware/hardware-configuration.nix
read -r -p "Are you sure? [y/N] " response

PASSED_ARG=$1
run_build () {
    SUDO=''
    if (( $EUID != 0 )); then
        SUDO='sudo'
    fi

    cd ~/nixconfig

    $SUDO cp /etc/nixos/hardware-configuration.nix system/hardware/hardware-configuration.nix
    git add .
    echo "NixOS Rebuilding..."
    $SUDO nixos-rebuild switch --flake . || (echo NixOS Rebuild failed! && exit 1)
    echo "NixOS Rebuild done!"
}

case "$response" in
    [yY][eE][sS]|[yY])
        run_build 
        ;;
    **)
        echo Aborted by user.
        exit 0
        ;;
esac

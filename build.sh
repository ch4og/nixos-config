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
    if [[ $PASSED_ARG != "-f" ]]; then
        if git diff --quiet '*.nix'; then
            echo "No changes detected, exiting."
            echo "Use -f to force rebuild"
            exit 0
        fi
    fi
            

    alejandra . &>/dev/null || ( alejandra . ; echo "formatting failed!" && exit 1)
    $SUDO cp /etc/nixos/hardware-configuration.nix system/hardware/hardware-configuration.nix
    $SUDO chown $USER system/hardware/hardware-configuration.nix
    echo "NixOS Rebuilding..."
    $SUDO nixos-rebuild switch --flake . || (echo NixOS Rebuild failed! && exit 1)
    echo NixOS Rebuild done!
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
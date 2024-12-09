#!/usr/bin/env nix-shell
#! nix-shell -i bash --impure
#! nix-shell -p pulseaudio

vban_receptor -i 10.42.0.253 -p 6980 -s winpc -b pulseaudio -q 0

#!/usr/bin/env bash
dd bs=1M | curl -X POST --header "x-api-key:$(cat ~/.chibi-apikey)" -F "image=@-" -F "name=$(date '+%Y%m%d-%H:%M:%S').png" https://chibi.ch4og.com/api/upload | jq -r '.url' | wl-copy

{ config, lib, pkgs, inputs, ... }: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [ obs-pipewire-audio-capture input-overlay ];
  };
}

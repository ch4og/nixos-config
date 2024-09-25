{ config, lib, pkgs, ... }: {
  programs.mangohud = {
    enable = true;
    settings = {
      gpu_stats = true;
      gpu_temp = true;
      cpu_stats = true;
      cpu_temp = true;
      swap = true;
      vram = true;
      ram = true;
      fps = true;
      vulkan_driver = true;
      gamemode = true;
      background_alpha = 0.4;
      font_size = 24;
    };
  };
}

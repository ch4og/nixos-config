{
  config,
  lib,
  pkgs,
  ...
}: {
  users.users.ch = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    packages = with pkgs; [
      firefox
      btop
      lsd
      starship
      kitty
      konsole
      fastfetch
    ];
  };
}

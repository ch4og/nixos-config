{ config, pkgs, ... }:

{
  xdg.configFile."rofimoji.rc".text = ''
        action = copy
    		max-recent = 0
  '';
}

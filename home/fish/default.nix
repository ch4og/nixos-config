{pkgs, ...}: {
  programs.fish = {
    enable = true;
    plugins = let
      pluginsList = with pkgs.fishPlugins; [tide sponge grc done bass fzf-fish];
    in (map (plugin: {
        name = plugin.name;
        src = plugin.src;
      })
      pluginsList);
    shellAliases = import ./aliases.nix;
    interactiveShellInit =
      (builtins.readFile ./init.fish)
      + ''
        ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
      '';
  };

  programs.eza = {
    enable = true;
    icons = "auto";
    enableFishIntegration = true;
  };
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = false;
  };
}

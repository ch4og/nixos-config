{pkgs, ...}: {
  programs = {
    fish = {
      enable = true;
      plugins = let
        pluginsList = with pkgs.fishPlugins; [tide sponge grc done bass fzf-fish];
      in
        map (plugin: {
          inherit (plugin) name;
          inherit (plugin) src;
        })
        pluginsList;
      shellAliases = import ./aliases.nix;
      interactiveShellInit =
        (builtins.readFile ./init.fish)
        + ''
          ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
        '';
    };

    eza = {
      enable = true;
      icons = "auto";
      enableFishIntegration = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = false;
    };
  };
}

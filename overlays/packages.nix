{inputs, ...}: _final: prev: {
  nekobox = inputs.nekobox.packages.${prev.system}.nekobox or {};
  nekoray = inputs.nekobox.packages.${prev.system}.nekoray or {};
  neovim = inputs.nvf.packages.${prev.system}.default or {};
  hyprland = inputs.hyprland.packages.${prev.system}.hyprland or {};
  split-monitor-workspaces = inputs.split-monitor-workspaces.packages.${prev.system}.split-monitor-workspaces or {};
}

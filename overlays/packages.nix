{inputs, ...}: _final: prev: {
  hyprland = inputs.hyprland.packages.${prev.system}.hyprland or {};
  nekobox = inputs.nekobox.packages.${prev.system}.nekobox or {};
  nekoray = inputs.nekobox.packages.${prev.system}.nekoray or {};
  neovim = inputs.nvf.packages.${prev.system}.default or {};
  split-monitor-workspaces = inputs.split-monitor-workspaces.packages.${prev.system}.split-monitor-workspaces or {};
}

{inputs, ...}: _final: prev: {
  nekobox = inputs.nekobox.packages.${prev.system}.nekobox or {};
  nvf = inputs.nvf.packages.${prev.system}.neovim or {};
  hyprland-git = inputs.hyprland-git.packages.${prev.system}.hyprland or {};
}

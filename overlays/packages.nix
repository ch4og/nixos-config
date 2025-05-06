{inputs, ...}: _final: prev: {
  nekobox = inputs.nekobox.packages.${prev.system}.nekobox or {};
  nekoray = inputs.nekobox.packages.${prev.system}.nekoray or {};
  neovim = inputs.nvf.packages.${prev.system}.neovim or {};
  hyprland = inputs.hyprland-git.packages.${prev.system}.hyprland or {};
  freesmlauncher = inputs.freesmlauncher.packages.${prev.system}.freesmlauncher or {};
}

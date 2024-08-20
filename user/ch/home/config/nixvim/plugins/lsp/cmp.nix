{pkgs, ...}: {
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings.sources = [
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "buffer";}
      ];

      settings.mapping = {
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<Tab>" = ''          cmp.mapping(
                        function(fallback)
                          if cmp.visible() then
                            cmp.select_next_item()
                          else
                            fallback()
                          end
                        end,
                      {'i', 's'})'';
      };
    };
    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
  };
}

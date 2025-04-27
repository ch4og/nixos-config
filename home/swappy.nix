{config, ...}: {
  xdg.configFile."swappy/config".text = ''
    [Default]
    save_dir=${config.home.homeDirectory}/Pictures/Screenshots
    save_filename_format=%Y-%m-%d-%H-%M-%S.png
    show_panel=true
    line_size=5
    text_size=20
    text_font=sans-serif
    paint_mode=brush
    early_exit=true
    fill_shape=false
    auto_save=true
    custom_color=rgba(193,125,17,1)
  '';
}

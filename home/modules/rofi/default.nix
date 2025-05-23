{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    plugins = with pkgs; [
      (rofi-calc.override {rofi-unwrapped = rofi-wayland-unwrapped;})
      rofimoji
      rofi-power-menu
    ];

    extraConfig = {
      modes = builtins.concatStringsSep "," (
        builtins.map
        (
          name:
            with builtins;
            with pkgs.lib.strings; "${(head (splitString " " name))}:${pkgs.${(head (splitString " " name))}}/bin/${name}"
        )
        [
          # Binary modes
          "rofi-power-menu --choices=shutdown/reboot/logout/lockscreen"
          "rofimoji"
        ]
        ++ [
          # Library modes
          "drun"
          "calc"
        ]
      );
    };

    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        font = "Noto Sans 12";
        bg0 = mkLiteral "#24242499";
        bg1 = mkLiteral "#7E7E7E60";
        bg2 = mkLiteral "#0860f299";

        fg0 = mkLiteral "#DEDEDE";
        fg1 = mkLiteral "#FFFFFF";
        fg2 = mkLiteral "#DEDEDE80";

        background-color = lib.mkForce (mkLiteral "transparent");
        text-color = mkLiteral "@fg0";

        margin = 0;
        padding = 0;
        spacing = 0;
      };
      window = {
        background-color = lib.mkIf (!config.stylix.enable) (mkLiteral "@bg0");
        location = mkLiteral "center";
        width = 800;
        border-radius = 8;
      };
      inputbar = {
        font = "Noto Sans 20";
        padding = mkLiteral "12px";
        spacing = mkLiteral "12px";
        children = map mkLiteral [
          "icon-search"
          "entry"
        ];
      };
      icon-search = {
        expand = false;
        filename = "search";
        size = mkLiteral "28px";
      };
      "icon-search, entry, element-icon element-text" = {
        vertical-align = mkLiteral "0.5";
      };
      entry = {
        font = mkLiteral "inherit";
        placeholder = "Search...";
        placeholder-color = mkLiteral "@fg2";
      };
      message = {
        border = mkLiteral "2px 0 0";
        border-color = lib.mkIf (!config.stylix.enable) (mkLiteral "@bg1");
        background-color = mkLiteral "@bg1";
      };
      textbox = {
        padding = mkLiteral "8px 24px";
      };
      listview = {
        lines = 12;
        columns = 1;
        fixed-height = false;
        border = mkLiteral "1px 0 0";
        border-color = lib.mkIf (!config.stylix.enable) (mkLiteral "@bg1");
      };
      element = {
        padding = mkLiteral "8px 16px";
        spacing = mkLiteral "16px";
        background-color = mkLiteral "transparent";
      };
      "element normal active" = {
        text-color = mkLiteral "@bg2";
      };
      "element alternate active" = {
        text-color = mkLiteral "@bg2";
      };
      "element selected normal, element selected active" = {
        background-color = mkLiteral "@bg2";
        text-color = mkLiteral "@fg1";
      };
      element-icon = {
        size = mkLiteral "1em";
      };
      element-text = {
        text-color = mkLiteral "inherit";
      };
    };
  };

  xdg.configFile."rofimoji.rc".text = ''
      action = copy
    max-recent = 0
  '';

  xdg.configFile."networkmanager-dmenu/config.ini".text = ''
    [dmenu]
    dmenu_command = rofi
  '';
}

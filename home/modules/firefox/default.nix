{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.betterfox-nix.homeModules.betterfox
  ];
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    betterfox = {
      enable = true;
      profiles."9rhmal6a.default" = {
        settings = {
          fastfox.enable = true;
        };
      };
    };
    profiles."9rhmal6a.default" = {
      isDefault = true;
      path = "9rhmal6a.default";
      name = "default";
      settings = {
        "widget.use-xdg-desktop-portal.file-picker" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "widget.dmabuf.force-enabled" = true;
        "privacy.webrtc.legacyGlobalIndicator" = false;
        "media.hardware-video-decoding.force-enabled" = true;
      };
      userChrome = ''
        @-moz-document url-prefix("chrome:") {
          #urlbar #identity-box.extensionPage #identity-icon-label {
            display: none !important;
          }
        }
      '';
    };
  };
}

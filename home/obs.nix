{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      input-overlay
      #obs-ndi
      obs-multi-rtmp
      (pkgs.obs-studio-plugins.obs-pipewire-audio-capture.overrideAttrs {
        version = "c8c57b39fddf01c365f3d1234edc983ee0da1b5b";
        src = pkgs.fetchFromGitHub {
          owner = "dimtpap";
          repo = "obs-pipewire-audio-capture";
          rev = "c8c57b39fddf01c365f3d1234edc983ee0da1b5b";
          hash = "sha256-qdwJS4WJxoIg2lIq3aHgBBrQr0Y56X4eZJzOjkwXegE=";
        };
        cmakeFlags = [];
      })
    ];
  };
}

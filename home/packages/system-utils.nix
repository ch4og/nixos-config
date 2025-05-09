{pkgs, ...}: {
  home.packages = with pkgs; [
    # Monitoring and Management
    (btop.override {cudaSupport = true;})
    lsof
    usbutils

    # Shell and Terminal
    starship
    eza
    ripgrep
    fd
    jq
    grc
    dust
    fastfetch
    inetutils

    # File Management
    unrar
    gtrash

    # Networking
    bind
    nmap
    openvpn
    traceroute

    # Media Processing
    ffmpeg-full
    ffmpegthumbnailer
    yt-dlp

    # System Integration
    alsa-utils
    cudaPackages.cudatoolkit

    # Analysis Tools
    binwalk
    exiftool

    # Virtualization and Compatibility
    wine-staging
    wine64Packages.staging
    distrobox
  ];
}

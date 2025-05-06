{
  # Aliases
  v = "nvim";
  ff = "fastfetch";
  o = "xdg-open";
  reload-waybar = "pkill -SIGUSR2 waybar";
  cybersec = "nix develop github:ch4og/nixcybersec";

  # Flags for commands
  ip = "ip -c";
  df = "df -h";
  free = "free -m";
  dust = "dust -d 1 ";
  lsd = "eza";
  ssh = "TERM=xterm-256color /run/current-system/sw/bin/ssh";

  # Replacements for commands
  cat = "bat -pp";
  man = "batman";
  grep = "rg";
  diff = "batdiff";
  watch = "batwatch";
}

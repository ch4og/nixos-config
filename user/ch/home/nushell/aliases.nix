{
  # Aliases
  v = "nvim";
  ff = "fastfetch";
  o = "xdg-open";
  reload-waybar = "pkill -SIGUSR2 waybar";
  cybersec = "nix develop github:ch4og/nixcybersec -c nu";
  _ = "env";

  # Flags for commands
  ip = "ip -c";
  df = "df -h";
  free = "free -m";
  fzf = "fzf --preview 'bat --color=always {}'";
  dust = "dust -d 1 ";
  lsd = "lsd --date '+%d.%m.%Y %H:%M'";

  # Replacements for commands
  cat = "bat -pp";
  man = "batman";
  grep = "rg";
  diff = "batdiff";
  watch = "batwatch";
}

{
  # Aliases
  v = "nvim";
  ff = "fastfetch";
  o = "xdg-open";
  reload-waybar = "pkill -SIGUSR2 waybar";
  cybersec = "nix develop ~/Nix/nixconfig -c zsh";

  # Flags for commands
  ip = "ip -c";
  df = "df -h";
  free = "free -m";
  fzf = "fzf --preview 'bat --color=always {}'";
  dust = "dust -d 1 ";

  # Replacements for commands
  ls = "lsd --date '+%d.%m.%Y %H:%M'";
  rm = "rmtrash";
  cat = "bat -pp";
  man = "batman";
  grep = "batgrep";
  rg = "batgrep";
  diff = "batdiff";
  watch = "batwatch";
}

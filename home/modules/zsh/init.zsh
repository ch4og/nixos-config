#ALT LEFT
bindkey '^[[1;3D' backward-word
#ALT RIGHT
bindkey '^[[1;3C' forward-word
#CTRL LEFT
bindkey '^[[1;5D' backward-word
#CTRL RIGHT
bindkey '^[[1;5C' forward-word
#CTRL BACKSPACE
bindkey '^H' backward-delete-char
#ALT BACKSPACE
bindkey '^[^?' backward-kill-word

# bash wordstyle
autoload -U select-word-style
select-word-style bash

# opts
unsetopt BEEP
setopt NOMATCH

# completion menu with colors
zstyle ':completion:*' menu select 
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"

# inits
eval "$(batpipe)"

if [[ "$0" = "/run/current-system/sw/bin/zsh" ]]; then
    fastfetch
fi


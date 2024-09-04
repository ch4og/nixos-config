# binds
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;2C" forward-word
bindkey "^[[1;2D" backward-word
bindkey '^H' backward-kill-word

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

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey "^[[1;2C" shift-select::forward-word
bindkey "^[[1;2D" shift-select::backward-word

autoload -U select-word-style
select-word-style bash

bindkey '^H' backward-kill-word

unsetopt BEEP
# setopt AUTO_CD
setopt GLOB_DOTS
setopt NOMATCH
setopt EXTENDED_GLOB
setopt INTERACTIVE_COMMENTS
setopt APPEND_HISTORY
setopt BANG_HIST
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

zstyle ':completion:*' menu select 
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"

if [[ "$0" = "/run/current-system/sw/bin/zsh" ]]; then
    fastfetch
fi

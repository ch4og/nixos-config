# binds
bind \cH backward-kill-path-component
fzf_configure_bindings --directory=\ct
set fzf_preview_dir_cmd eza --all --color=always --icons auto

eval "$(batpipe)"

function fish_greeting
    fastfetch
end

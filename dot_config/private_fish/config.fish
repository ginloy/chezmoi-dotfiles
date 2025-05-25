if status is-interactive
    # Commands to run in interactive sessions can go here
end

set EDITOR nvim
fish_add_path "$HOME/.local/bin"
source "$HOME/.cargo/env.fish"
alias lg="lazygit"
zoxide init fish | source
fastfetch

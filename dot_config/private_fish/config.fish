if status is-interactive
    # Commands to run in interactive sessions can go here
end

set EDITOR nvim
set -x ELECTRON_OZONE_PLATFORM_HINT auto
fish_add_path "$HOME/.local/bin"
source "$HOME/.cargo/env.fish"
alias lg="lazygit"
zoxide init fish | source
fastfetch

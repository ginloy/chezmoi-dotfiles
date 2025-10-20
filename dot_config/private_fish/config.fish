set EDITOR nvim
set -x BROWSER firefox
if type -q nvidia-smi
    set -x LIBVA_DRIVER_NAME nvidia
    set -x __GLX_VENDOR_LIBRARY_NAME nvidia
    set -x MOZ_DISABLE_RDD_SANDBOX 1
end
set -x ELECTRON_OZONE_PLATFORM_HINT auto
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/go/bin"
alias lg="lazygit"
bass source "$HOME/export-esp.sh"
if test -f "/home/linuxbrew/.linuxbrew/bin/brew"
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source

    if test -f ~/.cache/matugen/sequences
        cat ~/.cache/matugen/sequences | tr -d '[:space:]' | cat
    end
    zoxide init fish | source
    fastfetch
end

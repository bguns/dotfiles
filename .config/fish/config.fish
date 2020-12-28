# If OMF is not installed, assume fresh install
if not test -d ~/.config/omf
    source ~/.setup_scripts/fish-shell-setup.fish
end

set -gx PATH ~/.local/bin ~/.cargo/bin $PATH

set -g theme_nerd_fonts yes
set -g theme_color_scheme gruvbox

set -gx LS_COLORS (dircolors ~/.config/.dircolors | head -n 1 | sed 's/LS_COLORS=\'//' | sed 's/\';//')

cd /mnt/c/Users/Bert/Development

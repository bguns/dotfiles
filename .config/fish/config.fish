if not test -d $OMF_PATH/themes/bobthefish
    omf install bobthefish
end

set -gx PATH ~/.local/bin ~/.cargo/bin $PATH

set -g theme_nerd_fonts yes
set -g theme_color_scheme gruvbox

set -gx LS_COLORS (dircolors ~/.config/.dircolors | head -n 1 | sed 's/LS_COLORS=\'//' | sed 's/\';//')

cd /mnt/c/Users/Bert/Development

#!/bin/bash
# Update basic packages
sudo apt update && 
sudo apt upgrade -y;

# Install stack (do this first because of potentially broken stack + WSL interaction)
curl -sSL https://get.haskellstack.org | sh &&
export PATH="$HOME/.local/bin:$PATH" &&
stack install ghci;

# Get fish
sudo apt-add-repository ppa:fish-shell/release-3 -y &&
sudo apt-get update &&
sudo apt-get install fish -y &&
chsh -s /usr/bin/fish

# Get dotfiles
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' &&
echo ".cfg" >> .gitignore &&
git clone --bare https://github.com/bguns/dotfiles.git $HOME/.cfg &&
cfg checkout

# Disable auto-crlf (required for fish install)
git config --global core.autocrlf false

# Install oh-my-fish
curl -L https://get.oh-my.fish | fish &&
exit

git config --global core.autocrlf true
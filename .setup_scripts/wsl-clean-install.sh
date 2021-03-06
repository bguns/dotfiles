#!/bin/bash
# Update basic packages
echo "==== BASIC PACKAGE UPDATE ====";
sudo apt update && 
sudo apt upgrade -y;

# Install stack (do this first because of potentially broken stack + WSL interaction)
echo "==== INSTALL STACK ====";
curl -sSL https://get.haskellstack.org | sh &&
export PATH="$HOME/.local/bin:$PATH" &&
stack install ghci;

# Get fish
echo "==== GET FISH ====";
sudo apt-add-repository ppa:fish-shell/release-3 -y &&
sudo apt-get update &&
sudo apt-get install fish -y &&
sudo chsh -s /usr/bin/fish bguns;

# Get dotfiles
echo "==== GET DOTFILES ====";
[ ! -e $HOME/.gitconfig ] || rm $HOME/.gitconfig
echo ".cfg" >> .gitignore &&
git clone --bare https://github.com/bguns/dotfiles.git $HOME/.cfg &&
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout &&
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiled no;

# Install oh-my-fish
echo "==== INSTALL OH MY FISH ===="
curl -L https://get.oh-my.fish | fish

#!/bin/sh
sudo apt-get install -y git curl
cp gitconfig $HOME/.gitconfig
./script/setup-neovim
./script/setup-tmux
./script/setup-vim
./script/setup-youcompleteme
./script/setup-zsh

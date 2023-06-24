#!/bin/bash


sudo apt install git exa bat -y
sudo ln -s /usr/bin/batcat /usr/bin/bat

rm -rf .git

# Zsh Plugins
git clone https://github.com/bobthecow/git-flow-completion.git zshPlugins
git clone https://github.com/supercrabtree/k.git zshPlugins

if [ -d "~/Documents" ]
then
    mv zshPlugins ~/Documents
    ln -s ~/Documents ~/Dokumenty
else
    mv zshPlugins ~/Dokumenty
fi

# .config folder
if [ -d "~/.config" ]
then
    mv .config/* ~/.config
else
    mv .config ~/
fi

rm -r .config

# creating backups
cp ~/.zshrc ~/.zshrc.bak
cp ~/.vim ~/.vim.bak
cp ~/.gvimrc ~/.gvimrc.bak

# dotfiles
mv .* ~/

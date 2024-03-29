#!/bin/bash


sudo apt install git exa bat -y
sudo ln -s /usr/bin/batcat /usr/bin/bat

rm -rf .git

# Zsh Plugins
cd zshPlugins
git clone https://github.com/bobthecow/git-flow-completion.git
git clone https://github.com/supercrabtree/k.git
cd ..

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

# vim plugins
vim +'PlugInstall coc.nvim ctrlp.vim gruvbox lightline.vim nerdtree nerdtree-git-plugin undotree vim-devicons vim-expand-region vim-gitgutter vim-nerdtree-syntax-highlight vim-rtags vim-termtoggle yats.vim' +qa


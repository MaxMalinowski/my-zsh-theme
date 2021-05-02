#!/bin/zsh

git pull
ln -s `pwd`/raspberrysh.zsh-theme ~/.oh-my-zsh/themes/
sed -i -e 's/ZSH_THEME=.*/ZSH_THEME="raspberrysh"/' ~/.zshrc
source ~/.zshrc

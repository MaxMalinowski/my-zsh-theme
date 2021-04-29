#!/bin/zsh

git pull
ln -s `pwd`/raspberrydev.zsh-theme ~/.oh-my-zsh/themes/
sed -i -e 's/ZSH_THEME=.*/ZSH_THEME="raspberrydev"/' ~/.zshrc
source ~/.zshrc

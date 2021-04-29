#!/bin/bash

# make sure to have oh-my-zsh installed and running

ln -s ./raspberrydev.zsh-theme ~/.oh-my-zsh/themes/
sed -i -e 's/ZSH_THEME=.*/ZSH_THEME="raspberrydev"/g' ~/.zshrc
source ~/.zshrc

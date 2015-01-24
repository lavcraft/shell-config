#!/bin/bash

cd $(dirname $BASH_SOURCE)

#yaourt -S oh-my-zsh-git
curl -L http://install.ohmyz.sh | sh

#Install config
ln -sf `pwd`/configs/home/.oh-my-zsh/custom/themes ~/.oh-my-zsh/custom/themes

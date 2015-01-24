#!/bin/bash

cd $(dirname $BASH_SOURCE)

yaourt -S oh-my-zsh-git

#Install config

ln -sf `pwd`/configs/home/.oh-my-zsh/custom ~/.oh-my-zsh/cystom

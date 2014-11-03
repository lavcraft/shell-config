#!/bin/bash

cd $(dirname $BASH_SOURCE)

yaourt -S vim-vcscommand vim-systemd vim-project vim-jad vim-ctrlp vim-align vim-colorsamplerpack vim-surround vim-workspace ranger

#Install config

mv -v ~/.vimrc ~/.vimrc.old.`date +%Y-%m-%d`
ln -sf `pwd`/configs/home/.vimrc ~/.vimrc

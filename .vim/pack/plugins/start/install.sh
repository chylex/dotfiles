#!/bin/bash

pushd ~/.vim/pack/plugins/start > /dev/null

git clone https://github.com/easymotion/vim-easymotion.git
git clone https://github.com/itchyny/lightline.vim
git clone https://github.com/luochen1990/rainbow
git clone https://github.com/machakann/vim-highlightedyank
git clone https://github.com/mg979/vim-visual-multi
git clone https://github.com/michaeljsmith/vim-indent-object.git
git clone https://github.com/nelstrom/vim-visual-star-search
git clone https://github.com/vim-scripts/ReplaceWithRegister
git clone https://tpope.io/vim/repeat.git
git clone https://tpope.io/vim/sleuth.git
git clone https://tpope.io/vim/surround.git

popd > /dev/null


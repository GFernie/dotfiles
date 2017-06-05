#!/bin/sh
# Link dotfiles from this repo to their appropriate locations.

set -e

cd dotfiles
dotfiles=$(find . -type f)

for dotfile in ${dotfiles[@]}
do
    dotfile=$(echo $dotfile | cut -c 2-)
    dotfile_src=$(pwd)$dotfile
    dotfile_dst=${dotfile/#\/\~/$HOME}
    mkdir -p $(dirname $dotfile_dst)
    rm -f $dotfile_dst
    ln -sf $dotfile_src $dotfile_dst
done

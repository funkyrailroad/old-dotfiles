#! /bin/bash
for i in `ls | grep -v symlink_script.sh`; do
    #rm ~/.$i
    ln -s ~/.dotfiles/$i ~/.$i
done


# still need to have backup for preexisting files


# need to do bashrc
#ln -s ~/.dotfiles/gitconfig ~/.gitconfig
#ln -s ~/.dotfiles/vimrc ~/.vimrc
#ln -s ~/.dotfiles/vim ~/.vim
#ln -s ~/.dotfiles/i3 ~/.i3

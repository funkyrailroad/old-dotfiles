#! /bin/bash
#for i in `ls | grep -v symlink_script.sh`; do
    #rm ~/.$i
    #ln -s ~/.dotfiles/$i ~/.$i
#done


FILES=(GTD bashrc cron ctags.d gitconfig i3 inputrc ipython keepers terminal-config vim vimrc)
# still need to have backup for preexisting files

for i in ${FILES[@]}
do
	rm -r ~/.$i.bak
	mv -i ~/.$i ~/.$i.bak
	ln -s ~/.dotfiles/$i ~/.$i
done

# need to do bashrc
#ln -s ~/.dotfiles/gitconfig ~/.gitconfig
#ln -s ~/.dotfiles/vimrc ~/.vimrc
#ln -s ~/.dotfiles/vim ~/.vim
#ln -s ~/.dotfiles/i3 ~/.i3



#! /bin/bash

# needs to be done first
# git clone https://github.com/funkyrailroad/dotfiles .dotfiles
# cd .dotfiles
# ./symlink_script.sh
# jake.atwell@gmail.com ewwHIGH

# INSTALLING CTAGS
git clone https://github.com/universal-ctags/ctags.git
cd ctags

apt install \
    gcc make \
    pkg-config autoconf automake \
    python3-docutils \
    libseccomp-dev \
    libjansson-dev \
    libyaml-dev \
    libxml2-dev

./autogen.sh
./configure --prefix=/usr/local # defaults to /usr/local
make
make install # may require extra privileges depending on where to install

#https://github.com/universal-ctags/ctags/blob/master/old-docs/FAQ
# run ctags with ctags -R

# making sure YouCompleteMe works
cd ~/.dotfiles/vim/bundle/
rm -rf YouCompleteMe
https://github.com/ycm-core/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
python3 install.py --clangd-completer

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# set a prompt
# PS1="\u@\h:\w> "
PS1="\[\e[1;34m\]${SSH_TTY:+(ssh) }\u@\h:\[\e[1;34m\]\w>\[\e[0m\]"
export PS1

# default file creation setting
umask 022

###########################
# OS specific preferences
###########################

# Linux
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	# turn off bell completely
	xset b off
	setxkbmap -option "caps:swapescape"	
	setxkbmap -layout us,de
	setxkbmap -option 'grp:ctrl_alt_toggle'

    # enable color support of ls
    if [ "$TERM" != "dumb" ]
    then
        [ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
        [ -e "$DIR_COLORS" ] || DIR_COLORS=""
        eval "`dircolors -b $DIR_COLORS`"
        alias ls='ls --color=auto'
    fi

    # editing and sourcing bashrc shortcuts
	alias ev='vim ~/.bashrc'
	alias sv='source ~/.bashrc'

    # ls options
    alias la="\ls --color=always --group-directories-first -La"
    alias ll="\ls --color=always --group-directories-first -lh"
    alias ls="ls -L --color=always --group-directories-first"
    export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
    export LC_MESSAGES=POSIX # makes messages/man pages be in english


    if [ "${JOB_NAME}" != "" ]; then
            exit 0
    fi

    export HISTSIZE=-1
    export HISTFILESIZE=-1

# Mac OSX
elif [[ "$OSTYPE" == "darwin"* ]]; then
	alias showHiddenFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
	alias hideHiddenFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
    # editing and sourcing bashrc shortcuts
	alias ev='vim ~/.bash_profile'
	alias sv='source ~/.bash_profile'
	alias vim="/usr/local/Cellar/vim/8.1.0600/bin/vim"

    alias ls="ls -G"
    alias la="ls -a"
    alias ll="ls -l"
    alias lla="ls -la"
    export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# elif [[ "$OSTYPE" == "cygwin" ]]; then
	# POSIX compatibility layer and Linux environment emulation for Windows
# elif [[ "$OSTYPE" == "msys" ]]; then
	# Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
# elif [[ "$OSTYPE" == "win32" ]]; then
	# I'm not sure this can happen.
# elif [[ "$OSTYPE" == "freebsd"* ]]; then
	# ...
# else
	# Unknown.
fi



###########################
# Keyboard Options
###########################

#redshift in Berlin
#redshift -l 52.5:13.4 &

complete -d cd

# make text entry in bash act like vim
set -o vi
#bind -m vi-command ".":insert-last-argument
bind -m vi-insert C-k:yank-last-arg
bind -m vi-insert "\C-l.":clear-screen
bind -m vi-insert "\C-a.":beginning-of-line
bind -m vi-insert "\C-e.":end-of-line
bind -m vi-insert "\C-w.":backward-kill-word



EDITOR=vim
export EDITOR

if [ -e .bashrc_default ] 
then
    source .bashrc_default
fi

alias ec='vim -c "set nowrap" -O ~/vimwiki/weekly-plans/`date +%V`.md ~/vimwiki/weekly-plans/master-task-list.md'
alias ej='vim -c "set nowrap" -O ~/vimwiki/conifer-point/conifer-point-journal.md ~/vimwiki/conifer-point/literature.md'
alias ek='vim ~/.vim/keepers/keepers'
alias jf='fortune'



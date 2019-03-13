##########################
# MASTER THESIS OPTIONS
##########################


# load modules for build directory
alias loadbuildmodules='module purge; module load cmake/2.8.12.2-cuda boost/1_55_0 luajit/2.0.5 cuda/8.0 hdf5/1.10.0-patch1 gcc/4.9.4 git/2.18.0'
alias basiccheck='currentBranch=`git rev-parse --abbrev-ref HEAD`; git diff antialignment-gpu-2d HEAD -- `cat planning-files/${currentBranch}.txt`'


# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# set paths to optional packages
if [ -r /etc/profile.d/modules.sh ]
then
    source /etc/profile.d/modules.sh
fi
if [ -r /group/ag_compstatphys/opt/etc/profile.d/packages.sh ]
then
    source /group/ag_compstatphys/opt/etc/profile.d/packages.sh
fi

# load packages
module load cmake/2.8.12.2-cuda ninja lua git 2>/dev/null # ignore missing modules
#export PATH=/srv/public/jatwell/build/5th_halmd/halmd:$PATH
export PATH=~/master_thesis/tools:$PATH
export PATH="~/.bin-local/:$PATH"

# source command aliases
test -r ~/.alias && source ~/.alias || true

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# If this is an xterm set the title to user@host:dir
case $TERM in
xterm* | screen)	# not screen.linux, which is used on the console
    #PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
# easier with
    TITLEBAR="\[\033]0;${USER}@${HOSTNAME}: ${PWD}\007\]"
    ;;
*)
    TITLEBAR=''
    ;;
esac

# set a fancy prompt
PS1="\[\e[1;34m\]${SSH_TTY:+(ssh) }\u@\h:\[\e[1;34m\]\w>\[\e[0m\]"
PS1="\u@\h:\w> "

############################
# END MASTER THESIS OPTIONS
############################



alias sheldonssh='ssh -X jakeatwell@sheldon-ng.physik.fu-berlin.de'
alias homessh='/usr/bin/ssh -D 1080 -p 8712 RakishLitterPanelStager@goneaway.chickenkiller.com'
alias sshmersey='ssh -i ~/.ssh/priv-jake.pem jake@192.168.102.52'
alias sshneuse='ssh -i ~/.ssh/priv-jake.pem jake@192.168.102.120'
alias ek='vim ~/.vim/keepers/keepers'


alias jf='fortune'



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

    #############################
    # DEFAULT FROM FU BERLIN PHYSIK
    # $Id: DEFAULT,v 1.3 2003/07/03 09:55:38 tburnus Exp $
    LESS='-Mis'
    PAGER='less -r'
    PS1="\u@\h:\w> "
    PS2="\u@\h:\w> "
    export LESS PAGER PS1 PS2 PATH

    umask 022

    # Use these aliases
    # Note that the .alias file is used by csh only
    # alias rm='rm -i'
    # alias mv='mv -i'
    # alias cp='cp -i'

    if [ "${JOB_NAME}" != "" ]; then
            exit 0
    fi

    #########################
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

	# added by Anaconda3 5.3.0 installer
	# >>> conda init >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
	if [ $? -eq 0 ]; then
		\eval "$__conda_setup"
	else
		if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
			. "/anaconda3/etc/profile.d/conda.sh"
			CONDA_CHANGEPS1=false conda activate base
		else
			\export PATH="/anaconda3/bin:$PATH"
		fi
	fi
	unset __conda_setup
	# <<< conda init <<<


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

alias ec='vim ~/vimwiki/weekly-plans/`date +%V`.md'

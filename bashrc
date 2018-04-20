# COOL TRICKS TO REMEMBER
# cd -	goes to directory you just came from
# !!	repeats last command (ex. sudo !!)
# ^string1^string2	runs last command subbing string2 in for string1
# rename 's/string1/string2/' *.txt	renames files
# ctrl + w	delete word/argument to left of cursor
# ctrl + z; bg	suspend process; continue it in the background
# ctrl + c	quit line, new blank entry
# backgrounding and foregrounding different jobs
# <esc>.	inserts last arguments from you last bash command
# 
# COMMAND LINE TOOLS
# 
# 
# WGET 
# 
# wget -r -k www.website.com	recursively get all pages up to 5 levels deep, with local links so you can navigate the pages
# wget -m www.website.com 	mirror the whole website
# wget -i /path/to/inputfile 	read file of websites/links to download (for batch)
# wget -t 10 -T 9  -i /path/to/file 	retry 10 times and will try to connect for 9 seconds for each link in file
# wget -c www.website.com 	continue download
# wget -w 60 -i /path/to/file 	wait 60s between each retrieval (useful/considerate if downloading a lot from one source)
# wget --random-wait -i /path/to/inputfile 	waits a randomamt of time so you're not recognized as downloading from a script
# wget --user=yourusername --password=yourpassword <URL> 	login to a site (don't do on a multiuser computer, running ps will show your username and password)
# wget -A "*.mp3 -r <URL> 	only download filetype .mp3 from a website
# 
# 
# 
# 
# 
# 
# 


##########################
# MASTER THESIS OPTIONS
##########################

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
export PATH=/srv/public/jatwell/build/5th_halmd/halmd:$PATH
#export PATH=~/data/:$PATH
export PATH=~/master_thesis/tools:$PATH
export PATH="~/.bin-local/:$PATH"

# source command aliases
test -r ~/.alias && source ~/.alias || true

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# enable color support of ls
if [ "$TERM" != "dumb" ]
then
    [ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
    [ -e "$DIR_COLORS" ] || DIR_COLORS=""
    eval "`dircolors -b $DIR_COLORS`"
    alias ls='ls --color=auto'
fi

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

############################
# END MASTER THESIS OPTIONS
############################


############################
# Temporary location alias


############################

# DEFAULT FROM AG HOEFLING



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

alias sheldonssh='ssh -X jakeatwell@sheldon-ng.physik.fu-berlin.de'
alias homessh='/usr/bin/ssh -D 1080 -p 8712 RakishLitterPanelStager@goneaway.chickenkiller.com'
alias ev='vim ~/.bashrc'
alias sv='source ~/.bashrc'
alias ek='vim ~/.vim/keepers/keepers'

alias ls="ls --color=always --group-directories-first"
alias la="ls -a"
alias ll="ls -lh"
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export LC_MESSAGES=POSIX #makes messages/man pages be in english

alias jf='fortune'



###########################
# OS specific preferences#
###########################

#checking ostype, can use uname, $OSTYPE

# turn off bell completely
xset b off


###########################
# Keyboard Options
###########################

setxkbmap -option "caps:swapescape"	
setxkbmap -layout us,de
setxkbmap -option 'grp:ctrl_alt_toggle'
	

alias showHiddenFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideHiddenFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'


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



# GIT
# these don't work if the file is sourced outside of a git repository
#branch_name=$(git symbolic-ref -q HEAD)
#branch_name=${branch_name##refs/heads/}
#branch_name=${branch_name:-HEAD}

#gitPush() {
   #git push mpg $branch_name:sandbox/jake.atwell/$branch_name
#}
#alias gpush='gitPush'
EDITOR=vim
export EDITOR

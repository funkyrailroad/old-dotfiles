Tricks
============

jump to previous position before file was closed
'" 

How to drop to shell from vim, and return to vim
:sh, Ctrl+D to kill the shell and go back to vim


How to save a session in vim
:mksession ~/mysession.vim

open vim with an old session "mysession.vim"
vim -S mysession.vim


which register is for the system clipboard?
\+ register is for system clipboard

how to paste from the system clipboard in vim?
"+p
    

format the current paragraph (line wraps)
gqip
http://vim.wikia.com/wiki/Automatic_word_wrapping



how to count how many times the pattern occurs in the current buffer
:%s/pattern//n
    

insert figure template macro
EFI


ctags: Ctrl-] 
Jump to the tag underneath the cursor

ctags: Ctrl-t 
Jump back up in the tag stack

ctags: cts <tag> <RET> 
Search for a particular tag

ctags: tn 
Go to the next definition for the last tag

ctags: tp 
Go to the previous definition for the last tag

ctags: ts 
List all of the definitions of the last tag

ctags: tf
Go to first tag of the list

ctags: tl
go to last tag of the list

-----------------------

Scrollbinding is useful for viewing similar files. There's even a diff option
that automatically syncs them as best as it can. help scroll-binding

set scrolloff=5::

    this is the option that determines how much space is left between the
    cursor and the top/bottom of the window. Large number keeps it in the
    middle, and 0 lets you go all the way to the edges.


sorts a selection
:sort

go to the definition of a variable
gd

go to the beginning of the scope
[{

generate helptags using pathogen
cd <~/.vim/bundle/plugindir>
vim -c "helptags doc/"


how to create and go to marks
m{a-zA-Z} makes one, and use ` to go to the specific point of the mark and ' to
just go to the line

how to yank and append clipboard to another file
?

using tmux for session management
?

#STARTING READING THE VIM MANUAL

ctrl-]
jump to the entry of whatever is under the cursor.

ctrl-t or ctrl-o 
jump back to where you came from

:helpgrep
search help from all help files in vim

:help 02.3
jump to section 2.3 of help manual

ctrl-d while in command mode
show the possible options (similar to tab completion)

#there are undo trees, and one can jump between them

#vim can be configured to make backup files

how to reload the original version of the file?
:e!

# Chaper 3: Moving around
# list of movement commands hyperlink at top of usr_03.txt

how to move to end of PREVIOUS word/WORD?
ge / gE 

it's possible to change what vim considers a word ('iskeyword' option)

how to move to the next/previous 'x' in the line
fx / Fx

how to move right before the next / previous 'x' in the line
tx / Tx

how to move to the matching parenthesis ()?
%, can also be used in visual mode to select (Additional matchpair options can be set with the 'matchpairs' option.)

how to move to 3/4 of the way down a file?
75%

#03.7: scrolling around, alternatives to HJKL mappings which move the screen,
#not the cursor
scroll down/up half a screen of text
CTRL-D / CTRL-U

scroll full screen forward/backward
CTRL-F / CTRL-B

bring the line under your cursor to the top/middle/bottom of the screen
zt / zz / zb

how to match only exactly "the" and not i.e. other (matching beginning and ending of a word)
/\<the\> (can also only match beginning or end of the word)

#03.9 Simple search patterns (regex)
(regex) match beginning/end of a line 
^/$

(regex) how to match any single character 
.

#03.10: Using marks

jump forward / backward in jump history
CTRL-O / CTRL-I (even changes files)

:jumps gives a list of positions you've jumped to

how to set marks at "start" and "end" of a section
ms / me (easy to remember)

special mark: cursor position before doing a jump
'

special mark: cursor position when last editing the file
"

special mark: start/end of the last change
[ / ]

#
# Chapter 4: Making small changes
#

exclusive vs inclusive motions and operators 
w is exclusive (last character doesn't apply to the operator), e is inclusive

x  
stands for  dl  (delete character under the cursor)

X  
stands for  dh  (delete character left of the cursor)

D  
stands for  d$  (delete to end of the line)

C  
stands for  c$  (change to end of the line)

s  
stands for  cl  (change one character)

S  
stands for  cc  (change a whole line)

visual mode: o / O
jumps to other side of the selection (O is for block mode)

quickly switch two neighboring letters
xp


#04.6

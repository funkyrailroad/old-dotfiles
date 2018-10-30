let mapleader = ','
let maplocalleader = '\'

" List of .vimrc ideas
" do I want to remap escape to jk? 
" easy space in latex math mode
"
" try some of this stuff! 
" http://nvie.com/posts/how-i-boosted-my-vim/
" https://dougblack.io/words/a-good-vimrc.html

" TEMPORARY





"""""""""""""""""""""""""""""""""""""""""""
" tab settings
set tabstop=4
set shiftwidth=4
set expandtab

" tab completion
set wildmode=longest,list,full
set wildmenu

" stop double spacing after .!? when reformatting
set nojoinspaces

" prevent automatic indenting when pasting text into window
"set paste

" automatic text wrapping using textwidth
" http://vim.wikia.com/wiki/Automatic_word_wrapping
set textwidth=78
set fo+=t
" to unset automatic text wrapping
" set textwidth=0

" set fo-=l
" remove format option so a long line can be wrapped
" gq[range] wraps a passage
" gqq wraps current line
" gqip wraps current paragraph

"restores visual block mode!
nnoremap <C-V> <C-V>

set nowrapscan

" WINDOW NAVIGATION
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set splitbelow
set splitright

" functions for marking and swapping windows
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

" mappings for calling marking and swapping window functions
" https://stackoverflow.com/questions/2586984/how-can-i-swap-positions-of-two-open-files-in-splits-in-vim 
nmap <leader>wm :call MarkWindowSwap()<CR>
nmap <leader>ws :call DoWindowSwap()<CR>

nnoremap <leader>ev :80vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <space> za
nnoremap - ddp
nnoremap _ ddkkp

nnoremap H 0
nnoremap L $
vnoremap H 0
vnoremap L $
vnoremap K 10k
vnoremap J 10j

nnoremap J 10j
nnoremap K 10k
" inoremap () ()<esc>i
" inoremap [] []<esc>i
" inoremap {} {}<esc>i
" inoremap '' ''<esc>i
" inoremap "" ""<esc>i
" inoremap <> <><esc>i

nnoremap <leader><space> :set hlsearch!<cr>
nnoremap <leader>sp :set spell!<cr>

" enclose current word in parenthesis (doesn't work if word is right before
" EOL
nnoremap <leader>" viw<esc>i"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>i'<esc>hbi'<esc>lel
nnoremap <leader>{ viw<esc>i}<esc>hbi{<esc>lel


inoremap <c-u> <esc>viwUea


vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>`>ll
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>`>ll

set number
set relativenumber

" abbreviations
abbrev @@ jake.atwell@gmail.com


" open meta keepers file, about vim itself
nnoremap <leader>ek :80vsplit ~/.vim/keepers/vim.rst<cr>

" set filetype shortcut
nnoremap <leader>fc :set filetype=cpp<cr>


""""""""""""""""""""""""""
" autocommands




set visualbell

" format options, make it so comments aren't carried automatically to new lines
set formatoptions-=c
set formatoptions-=r
set formatoptions-=o
set ignorecase 

""""""""""""""""""""""""

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin



" setting back up directories
set backupdir=~/.vim/vimtmp,.
set directory=~/.vim/vimtmp,.
set backup


" no persisistance undo
set noundofile


" '''''''''''''''''''
" PLUGINS
" '''''''''''''''''''
" vimawesome.com for tons of plugins and installation directions


""""""""""""""""""""""""""
" pathogen plugin manager settings

execute pathogen#infect()
syntax on
filetype plugin indent on


""""""""""""""""""""""""""
" LUA
augroup filetype_lua
    autocmd!
    autocmd FileType lua nnoremap <buffer> <localleader>ek :80vsplit ~/.vim/keepers/lua.rst<cr>
    "autocmd FileType lua nnoremap <buffer> <localleader>c mpI-- <esc>`pl
augroup END



""""""""""""""""""""""""""
" PYTHON
augroup filetype_python
    autocmd!
    autocmd FileType python setlocal textwidth=0
    autocmd FileType python nnoremap <buffer> <localleader>ek :80vsplit ~/.vim/keepers/py.rst<cr>
    "autocmd FileType python nnoremap <buffer> <localleader>c mpI#<esc>`pl
    autocmd FileType python nnoremap <buffer> <localleader>r :w<cr>:!python %<cr>
augroup END

""""" jedivim
    let g:jedi#documentation_command = "<leader>l"
    let g:jedi#popup_on_dot = 0




""""""""""""""""""""""""""
" RESTRUCTUREDTEXT 
augroup filetype_rst
        autocmd!
        autocmd BufNewFile,BufRead *.rst nnoremap <localleader>r :w<CR>:!rst2html % > %.html; firefox %.html<CR><CR>
    autocmd BufNewFile,BufRead *.rst nnoremap <buffer> <localleader>ek :80vsplit ~/.vim/keepers/rst.rst<cr>
augroup END


""""""""""""""""""""""""""
" C++

function! SwitchSourceHeader()
  "update!
  if (expand ("%:e") == "cpp")
    find %:t:r.hpp 
  elseif (expand ("%:e") == "hpp")
    find %:t:r.cpp
  endif
endfunction

nmap <leader>ss :call SwitchSourceHeader()<CR>

augroup filetype_cpp
    autocmd!
    autocmd BufNewFile,BufRead *.{cpp,hpp,cu,cuh} nnoremap <buffer> <localleader>ek :80vsplit ~/.vim/keepers/cpp.rst<cr>
    "autocmd BufNewFile,BufRead *.{cpp,hpp,cu,cuh} nnoremap <buffer> <localleader>c mpI//<esc>`pl
    au BufNewFile,BufRead *.{cu,cuh} set ft=cuda
augroup END



""""""""""""""""""""""""""
" ctags
set tags=./tags


""""""""""""""""""""""""""
" Text

augroup filetype_latex
    autocmd!
    "autocmd BufNewFile,BufRead *.tex nnoremap <localleader>c mpI%<esc>`pl
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <localleader>ek :80vsplit ~/.vim/keepers/tex.rst<cr>
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <localleader>ev :80vsplit ~/.vim/bundle/latex/ftplugin/tex.vim<cr>:lcd %:p:h<cr>
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <localleader>sv :source ~/.vim/bundle/latex/ftplugin/tex.vim<cr>
    "autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <localleader>ev :80vsplit ~/.vim/bundle/latex/ftplugin/latex-suite/envmacros.vim<cr>
augroup END


""""""""""""""""""""""""""
" LATEX


augroup filetype_latex
    autocmd!
    "autocmd BufNewFile,BufRead *.tex nnoremap <localleader>c mpI%<esc>`pl
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <localleader>ek :80vsplit ~/.vim/keepers/tex.rst<cr>
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <localleader>ev :80vsplit ~/.vim/bundle/latex/ftplugin/tex.vim<cr>:lcd %:p:h<cr>
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <localleader>sv :source ~/.vim/bundle/latex/ftplugin/tex.vim<cr>
    "autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <localleader>ev :80vsplit ~/.vim/bundle/latex/ftplugin/latex-suite/envmacros.vim<cr>
augroup END
        
    " vimlatex

    " REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
    filetype plugin on

    " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
    " can be called correctly.
    set shellslash

    " IMPORTANT: grep will sometimes skip displaying the file name if you
    " search in a singe file. This will confuse Latex-Suite. Set your grep
    " program to always generate a file-name.
    set grepprg=grep\ -nH\ $*

    " OPTIONAL: This enables automatic indentation as you type.
    filetype indent on

    " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
    " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
    " The following changes the default filetype back to 'tex':
    let g:tex_flavor='latex'


""""""""""""""""""""""""""
" GIT
augroup filetype_git
    autocmd!
    autocmd Filetype gitcommit setlocal spell textwidth=72
augroup END

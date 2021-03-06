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

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

" referesh file contents if file is changed on disc
" https://stackoverflow.com/questions/2157914/can-vim-monitor-realtime-changes-to-a-file
set autoread | au CursorHold * checktime | call feedkeys('lh')


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


" make extra whitespace visible
" https://vim.fandom.com/wiki/Highlight_unwanted_spaces
set list

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
" nmap <leader>wm :call MarkWindowSwap()<CR>
" nmap <leader>ws :call DoWindowSwap()<CR>

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


" capitalize current word
inoremap <c-u> <esc>viwUea


vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>`>ll
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>`>ll

set nonumber
set norelativenumber
"set mouse=a

" abbreviations
abbrev @@ jake.atwell@gmail.com


" open meta keepers file, about vim itself
nnoremap <leader>ek :80vsplit ~/.dotfiles/keepers/vim<cr>

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

" make things behave like windows
" set nocompatible
" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
"
" behave mswin



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

execute pathogen#infect('bundle/{}')
syntax on
filetype plugin indent on


""""""""""""""""""""""""""
" YouCompleteMe

set encoding=utf-8
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

""""""""""""""""""""""""""
" UltiSnips

let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file



" '''''''''''''''''''
" FILETYPES
" '''''''''''''''''''

""""""""""""""""""""""""""
" LUA
augroup filetype_lua
    autocmd!
    autocmd FileType lua nnoremap <buffer> <localleader>ek :80vsplit ~/.dotfiles/keepers/lua<cr>
    "autocmd FileType lua nnoremap <buffer> <localleader>c mpI-- <esc>`pl
augroup END



""""""""""""""""""""""""""
" PYTHON
augroup filetype_python
    autocmd!
    autocmd FileType python setlocal textwidth=0
    autocmd FileType python setlocal shiftwidth=4
    autocmd FileType python setlocal tabstop=4
    autocmd FileType python setlocal softtabstop=4
    autocmd FileType python nnoremap <buffer> <localleader>ek :80vsplit ~/.dotfiles/keepers/py<cr>
    "autocmd FileType python nnoremap <buffer> <localleader>c mpI#<esc>`pl
    autocmd FileType python nnoremap <buffer> <localleader>r :w<cr>:!python %<cr>
    autocmd FileType python setlocal completeopt-=preview
augroup END

""""" jedivim
    let g:jedi#documentation_command = "<leader>l"
    let g:jedi#popup_on_dot = 0




""""""""""""""""""""""""""
" RESTRUCTUREDTEXT 
augroup filetype_rst
        autocmd!
        autocmd BufNewFile,BufRead *.rst nnoremap <localleader>r :w<CR>:!rst2html % > %.html; firefox %.html<CR><CR>
    autocmd BufNewFile,BufRead *.rst nnoremap <buffer> <localleader>ek :80vsplit ~/.dotfiles/keepers/rst<cr>
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
    autocmd BufNewFile,BufRead *.{cpp,hpp,cu,cuh} nnoremap <buffer> <localleader>ek :80vsplit ~/.dotfiles/keepers/cpp<cr>
    "autocmd BufNewFile,BufRead *.{cpp,hpp,cu,cuh} nnoremap <buffer> <localleader>c mpI//<esc>`pl
    au BufNewFile,BufRead *.{cu,cuh} set ft=cuda
augroup END



""""""""""""""""""""""""""
" ctags
set tags=./.git/tags
"set tags=./tags


""""""""""""""""""""""""""
" Text

augroup filetype_latex
    autocmd!
    "autocmd BufNewFile,BufRead *.tex nnoremap <localleader>c mpI%<esc>`pl
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <localleader>ek :80vsplit ~/.dotfiles/keepers/tex<cr>
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <localleader>ev :80vsplit ~/.vim/bundle/latex/ftplugin/tex.vim<cr>:lcd %:p:h<cr>
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <localleader>sv :source ~/.vim/bundle/latex/ftplugin/tex.vim<cr>
    "autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <localleader>ev :80vsplit ~/.vim/bundle/latex/ftplugin/latex-suite/envmacros.vim<cr>
augroup END


""""""""""""""""""""""""""
" LATEX


augroup filetype_latex
    autocmd!
    "autocmd BufNewFile,BufRead *.tex nnoremap <localleader>c mpI%<esc>`pl
    autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <localleader>ek :80vsplit ~/.dotfiles/keepers/tex<cr>
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
" vimwiki
set nocompatible 
filetype plugin on
syntax on
" let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', 'mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]


"""""""""""""""""""""""""
augroup filetype_markdown
    autocmd!
    autocmd Filetype mkd setlocal wrap
    autocmd Filetype mkd setlocal linebreak
    autocmd Filetype mkd setlocal nolist  " list disables linebreak
    autocmd Filetype mkd setlocal textwidth=78
    autocmd Filetype mkd setlocal wrapmargin=0
    autocmd Filetype mkd setlocal foldmethod=indent
augroup END


"""""""""""""""""""""""""
augroup filetype_git
    autocmd!
    autocmd Filetype gitcommit setlocal spell textwidth=72
augroup END

" set visual bell to nothing
set t_vb=


" append selected text to a collection file
vnoremap <leader>gd "zy:call writefile(getreg('z',1,1),"/home/stic/.dotfiles/GTD/capture", "a")<cr>

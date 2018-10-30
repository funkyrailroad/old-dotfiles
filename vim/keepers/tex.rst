Keepers
=======

type characters without formatting (i.e. computer code, keep literal spacing)
verbatim environment EVM or \\verb|...| for inline

where are the latex settings saved?
~/.vim/bundle/latex/ftplugin/latex-suite/

where are the vimlatex environment macro definitions saved?
~/.vim/bundle/latex/ftplugin/latex-suite/envmacros.vim

viewer options are under the option::
    else 
        if executable('xdg-open')

`dvi viewer is able to handle forward and backward search by inserting "source
specials." add the --src-specials flag to the compiler.
<http://tex.imm.uran.ru/tex/yap.html#SEC8>`_

synctex offers forward and backward searching for pdfs


how to deactivate portions of the latex code to speed up compile time::
\iffalse
...
\fi

# bold greek letters
\pmb{\omega}

~
non-breaking space

Bibtex
~~~~~~~~
how to compile bibtex 
pdflatex -interaction=nonstopmode file.tex
bibtex file
pdflatex -interaction=nonstopmode file.tex

how to include bibliography in the main tex file
\bibliography{mybib}
\bibliographystyle{ieeetr}


# citing with author's name and year
\usepackage[numbers,sort&compress]{natbib}
citet{einstein}

# another way of citing with author's name and year
\usepackage[round]{natbib}
\bibliographystyle{plainnat}
\cite{}  -->   Author et al., 2006
\citep{} -->  (Author et al., 2006)


# autocomplete citation
<c-n> inside of \cite{}, type and press <c-n> again to cycle through options


# support umlaut characters
\usepackage[utf8]{inputenc} 

# go to next misspelled word,
http://thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html
]s

# vimlatex cheatsheet
https://michaelgoerz.net/refcards/vimlatexqrc.pdf

# add word to your own word list permanently/temporarily
zg / zG


Suggestions
==============

change compile keyboard shortcut in line 870 of compiler.vim

- change \`/ remap to \cfrac instead of \frac

- change compile option to \\r like other file types (decide if I want just
    compile, or compile and view together)

- shortcut for derivatives (maybe ddx and ddt because they're the most common)

- change the insert fig template




Sources
===============



$VIM/ftplugin/latex-suite/texrc, move them to $VIM/ftplugin/tex.vim and edit
them there

Can find the placeholder mapping functions and shortcuts in 
.vim/bundle/latex/plugin/imaps.vim

customizing latex-suite
http://vim-latex.sourceforge.net/documentation/latex-suite/customizing-latex-suite.html


restructured text help
http://docutils.sourceforge.net/docs/user/rst/quickref.html

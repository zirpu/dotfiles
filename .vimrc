
set encoding=utf-8          " The encoding displayed
set fileencoding=utf-8      " The encoding written to file
set cursorline              " Find the current line quickly.
"set scrolloff=99           " stay centered.

set nocompatible            " choose no compatibility with legacy vi
syntax on
set encoding=utf-8
set showcmd                 " display incomplete commands
filetype plugin on          " load file type plugins + indentation

set nowrap                  " don't wrap lines
" a tab is 4 spaces
set tabstop=4
set expandtab                    " use spaces, not tabs (optional)
"set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                   " searches are case insensitive...
set smartcase                    " ... unless they contain at least one capital letter


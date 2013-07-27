set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'vim-scripts/taglist.vim'
Bundle 'rodjek/vim-puppet'
Bundle 'wannesm/wmgraphviz.vim'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/rubycomplete.vim'
Bundle 'tpope/vim-markdown'
Bundle 'suan/vim-instant-markdown'
Bundle 'vim-ruby/vim-ruby'

filetype plugin indent on
set ts=4
set sts=4
set sw=4
syn on
set et

set ruler
set number
set modeline
set modelines=5
syntax on
set t_Co=256
set showmode
set encoding=utf-8
set autoindent
set backspace=indent,eol,start
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

set wrap
set textwidth=79
set formatoptions=qrn1

:highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_json_checker="jsonlint"

let g:WMGraphviz_output="svg"
let g:WMGraphviz_viewer="open"

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
""improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<C-X><C-O>"

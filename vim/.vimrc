set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" My Plugins
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'taglist.vim'
Plugin 'rodjek/vim-puppet'
Plugin 'wannesm/wmgraphviz.vim'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-fugitive'
Plugin 'suan/vim-instant-markdown'
Plugin 'vim-ruby/vim-ruby'
Plugin 'davidhalter/jedi-vim'
Plugin 'xolox/vim-misc'
Plugin 'easytags.vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'dougireton/vim-chef'
Plugin 'lambdalisue/vim-pyenv'

call vundle#end()
filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent

" code folding
set foldmethod=indent
set foldlevel=2
set foldnestmax=4
" don't fold unless requested
set nofoldenable

set ruler
set number
syntax on
" set t_Co=256
set encoding=utf-8
set backspace=indent,eol,start
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

set textwidth=79
set formatoptions=qrn1

" crosshair
hi CursorLine cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=235
set cursorline! cursorcolumn!
nmap <silent> <Leader>c :set cursorline! cursorcolumn!<CR>

:highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_yaml_checkers=['js-yaml']

let g:WMGraphviz_output="svg"
let g:WMGraphviz_viewer="open"

"puppet
set kp=pi
set iskeyword=-,:,@,48-57,_,192-255

"ruby
compiler ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
""improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

"airline
set laststatus=2
let g:airline_powerline_fonts = 1

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Don't store swap files in $CWD
set backupdir=/tmp//
set directory=/tmp//

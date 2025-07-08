" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'lifepillar/vim-solarized8'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

set nocompatible
set nu
set cindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set textwidth=80

filetype plugin indent on
syntax enable

"nerdtree
let mapleader=","
map <Leader>n :NERDTreeToggle<CR>
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
" NERDTree를 열 때 숨김 파일을 기본적으로 표시
let NERDTreeShowHidden=1

set background=dark
colorscheme solarized8

let g:airline_theme='solarized'
"let g:airline_solarized_bg='dark'

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

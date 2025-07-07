set nocompatible 
filetype off 
"Vundle install
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim 
set textwidth=80
call vundle#begin() 
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'lifepillar/vim-solarized8'
Plugin 'scrooloose/nerdtree'
"#Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()        

set nu
set cindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
syntax enable
filetype plugin indent on

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

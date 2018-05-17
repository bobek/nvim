set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

let g:mapleader=',' 
let g:maplocalleader='\\'
set number
set encoding=utf-8

set hlsearch
set incsearch
set ignorecase
set smartcase
map <CR> :nohl<cr>

set cursorline
set cursorcolumn

set title

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

call plug#begin('~/.config/nvim/plugged')
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
    let g:deoplete#enable_at_startup = 1
    " use tab for completion
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

  Plug 'sheerun/vim-polyglot'
  Plug 'tomasr/molokai'

  Plug 'neomake/neomake'
    augroup localneomake
      autocmd! BufWritePost * Neomake
    augroup END
    let g:neomake_markdown_enabled_makers = []

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1

  Plug 'ctrlpvim/ctrlp.vim'
    map <C-b> :CtrlPBuffer<CR>

  Plug 'c-brenn/phoenix.vim'
  Plug 'tpope/vim-projectionist'
  Plug 'slashmili/alchemist.vim'

  Plug 'sudar/vim-arduino-syntax'
  Plug 'scrooloose/nerdcommenter'

  Plug 'rhysd/vim-grammarous'
call plug#end()

set background=dark
syntax enable
colorscheme molokai

setlocal spell spelllang=en_us
if filereadable("/usr/share/dict/words")
  set dictionary+=/usr/share/dict/words
endif

hi SpellBad cterm=underline

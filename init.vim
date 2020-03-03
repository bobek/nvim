set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

let g:mapleader=',' 
let g:maplocalleader='\\'
set encoding=utf-8

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

    Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

  Plug 'sheerun/vim-polyglot'

  " Color schemes
  Plug 'NLKNguyen/papercolor-theme'

  " Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
  " Plug 'w0rp/ale'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

  " Plugins for Elixir / Phoenix development
  Plug 'slashmili/alchemist.vim'
  Plug 'elixir-editors/vim-elixir'

  Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

  " (Optional) Multi-entry selection UI.
  Plug 'junegunn/fzf'

  Plug 'scrooloose/nerdcommenter'

  Plug 'rhysd/vim-grammarous'

  Plug 'fatih/vim-go'
call plug#end()

" General settings {{{
set encoding=utf-8
set t_Co=256                      " moar colors
" set clipboard=unnamed             " use system clipboard
set nocompatible                  " nocompatible is good for humans
syntax enable                     " enable syntax highlighting...
filetype plugin indent on         " depending on filetypes...
set pastetoggle=<F12>             " for pasting code into Vim
set timeout tm=1000 ttm=10        " fix slight delay after pressing Esc then O
set autoread                      " auto load files if vim detects change
set autowrite                     " auto write files when moving around
set nobackup                      " disable backup files...
set noswapfile                    " and swap files

" Style
set background=dark
colorscheme PaperColor
let g:airline_theme='papercolor'

set number                        " line numbers are cool
set ruler                         " show the cursor position all the time
set nocursorline                  " disable cursor line
set showcmd                       " display incomplete commands
set novisualbell                  " no flashes please
set scrolloff=3                   " provide some context when editing
set hidden                        " allow backgrounding buffers without writing them, and
                                  " remember marks/undo for backgrounded buffers
" List chars
set listchars=""                  " reset the listchars
set listchars=tab:▸\ ,eol:¬       " a tab should display as "▸ ", end of lines as "¬"
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " the character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " the character to show in the first column when wrap is
                                  " off and the line continues beyond the left of the screen
set fillchars+=vert:\             " set vertical divider to empty space

" Searching
set hlsearch                      " highlight matches...
nohlsearch                        " but don't highlight last search when reloading
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " unless they contain at least one capital letter

map <CR> :nohl<cr>

setlocal spell spelllang=en_us
if filereadable("/usr/share/dict/words")
  set dictionary+=/usr/share/dict/words
endif

hi SpellBad cterm=underline

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['solargraph', 'stdio'],
    \ 'elixir': ['~/bin/elixir-ls/release/language_server.sh'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

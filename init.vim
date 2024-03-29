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
  "Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
  "  let g:deoplete#enable_at_startup = 1
  "  " use tab for completion
  "  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

  "  Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

  Plug 'sheerun/vim-polyglot'
    let g:vim_markdown_conceal = 0

  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
    let g:NERDTreeShowHidden = 1
    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeIgnore = []
    let g:NERDTreeStatusline = ''
    nnoremap <silent> <C-e> :NERDTreeToggle<CR>

  " Color schemes
  Plug 'NLKNguyen/papercolor-theme'

  " Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
  Plug 'dense-analysis/ale'
    let g:ale_fix_on_save = 1
    let g:ale_fixers = {
          \ 'elixir': ['mix_format'],
          \ 'go': ['gofmt'],
          \ }

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " use :CocInstall to install appropriate plugins

  " Debugger: https://github.com/puremourning/vimspector

  Plug 'sjl/gundo.vim'
    nnoremap <F5> :GundoToggle<CR>
    let g:gundo_prefer_python3 = 1

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1

  Plug 'ctrlpvim/ctrlp.vim'
    map <C-b> :CtrlPBuffer<CR>

  Plug 'junegunn/vim-peekaboo'

  Plug 'Yggdroot/indentLine'
    let g:indentLine_char = '▏'

  "Plug 'junegunn/fzf'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
    "let $FZF_DEFAULT_COMMAND = 'ag -g ""'
    let $FZF_DEFAULT_COMMAND='rg --files --hidden'
    let $FZF_DEFAULT_OPTS='-m --height 50% --border'
    nnoremap <silent> <Leader>f :Rg<CR>
    set grepprg=rg\ --vimgrep

    command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
      \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
      \   <bang>0)

  Plug 'preservim/nerdcommenter'

  Plug 'rhysd/vim-grammarous'

  " Show changes directly in the code
  Plug 'mhinz/vim-signify'

  Plug 'ferrine/md-img-paste.vim'
    autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

  Plug 'dyng/ctrlsf.vim'
    nmap     <C-F>f <Plug>CtrlSFPrompt
    vmap     <C-F>f <Plug>CtrlSFVwordPath
    vmap     <C-F>F <Plug>CtrlSFVwordExec
    nmap     <C-F>n <Plug>CtrlSFCwordPath
    nmap     <C-F>p <Plug>CtrlSFPwordPath
    nnoremap <C-F>o :CtrlSFOpen<CR>
    nnoremap <C-F>t :CtrlSFToggle<CR>
    inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

  " Flash cursor after long jump
  Plug 'danilamihailov/beacon.nvim'
    let g:beacon_minimal_jump = 15
    let g:beacon_size = 20
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

"set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    +-- current column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer

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

" Splits
set splitbelow
set splitright
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


" enable indentation
set breakindent
" ident by an additional 2 characters on wrapped lines, when line >= 40 characters, put 'showbreak' at start of line
" set breakindentopt=shift:2,min:40,sbr
" append '>>' to indent
" set showbreak=>>

" Correct typos in insert mode.  Copied from <https://castel.dev/post/lecture-notes-1/>.
" inoremap <C-k> <C-G>u<Esc>[s1z=`]a<C-G>u

" Open file under cursor non blocking (vs gx)
nnoremap gX :silent :execute
            \ "!xdg-open" expand('%:p:h') . "/" . expand("<cfile>") " &"<cr>

" Surround word under cursor with the character after q
nnoremap <leader>q :let c=nr2char(getchar())\|:exec "normal viwo\ei".c."\eea".c."\e"<CR>

if has('persistent_undo')
    let target_path = expand('/tmp/$USER-nvim-persistent-undo/')
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
        call system('chmod 700 ' . target_path)
    endif

    let &undodir = target_path
    set undofile
endif

source $HOME/.config/nvim/coc.vim

set secure

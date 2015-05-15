" NeoBundle {{{
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
 if &compatible
   set nocompatible               " Be iMproved
  endif

 " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'sjl/badwolf'
NeoBundle 'bling/vim-airline'
NeoBundle 'octol/vim-cpp-enhanced-highlight'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
" }}}

" Color {{{
colorscheme badwolf
syntax on " enalbe syntax processing
" }}}

set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab
set expandtab
set smarttab

set hidden

set number " show line numbers
set relativenumber " show relative line numbers
set showcmd " show command in bar
set cursorline " highlight line

filetype indent on " load indent files

set wildmenu " visual autocomplete

set lazyredraw " redraw only when needed
set showmatch " highlight matching parens
set ttyfast

set magic

" Visual {{{
set list
set listchars+=space:·,eol:↵,tab:>>
" }}}

set virtualedit=all " enable moving over nothing

" Searching {{{
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" Folding {{{
set foldenable " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
" }}}

let mapleader=","       " leader is comma

" Be gone {{{
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" }}}

" edit vimrc and load vimrc bindings
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

set modelines=1

" GUI {{{
set mousehide
set guioptions=acg

" Maximize window on start
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif
" }}}

" vim-airline {{{
set laststatus=2
let g:airline#extensions#tabline#enabled=1
" }}}

" vim:foldmethod=marker:foldlevel=0

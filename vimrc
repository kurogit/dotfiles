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
"NeoBundle 'sjl/badwolf'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'
NeoBundle 'octol/vim-cpp-enhanced-highlight'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ervandew/supertab'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'lervag/vimtex'
NeoBundle 'vim-scripts/a.vim'

" Unix only plugins:
if has('unix')
    NeoBundle 'Valloric/YouCompleteMe'
    NeoBundle 'rdnetto/YCM-Generator'
endif

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
" }}}

" General {{{
set history=700

filetype indent on " load indent files
filetype plugin on " load plugin files

" Set to auto read when a file is changed outside
set autoread

" Leader maps
let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr>

" }}}

" UI {{{
set wildmenu " visual autocomplete

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Show current position
set ruler

set number " show line numbers
set relativenumber " show relative line numbers
set showcmd " show command in bar
"set cursorline " highlight line

" Enable virtual edit
"set virtualedit=all
" Height of command bar
set cmdheight=2

" Unwritten buffers can hide
set hidden

" Backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" }}}

" Color and font {{{
syntax on " enalbe syntax processing
set background=light
let g:solarized_termcolors=256
colorscheme solarized

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac
" }}}

" Text, tab and indent related {{{
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"
set list
set listchars+=trail:·,eol:↵,tab:>>
" }}}

" Folding {{{
set foldenable " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
" }}}

" Moving around, windows and buffers {{{

" Away with arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :bd<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
"set viminfo^=%

" edit vimrc and load vimrc bindings
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

set modelines=1

" }}}

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

" NERDTree {{{
map <F5> :NERDTreeToggle<cr>
" }}}

" Utilsnippets + YCM {{{
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" }}}

" YCM {{{
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
" }}}

" clang-format {{{
map <C-K> :%pyf /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:%pyf /usr/share/clang/clang-format.py<cr>
" }}}

" vimtex {{{
" Use ycm for completion
if !exists('g:ycm_semantic_triggers')

    let g:ycm_semantic_triggers = {}
  endif
  let g:ycm_semantic_triggers.tex = [
        \ 're!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*'
        \ ]

let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
" }}}

" Misc {{{
" Spell checking
set spell
set spelllang=de,en

" Doxygen
let g:load_doxygen_syntax=1

" Latex
let g:tex_flavor = "latex"

" Auto close Quickfix window
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END
" }}}

" vim:foldmethod=marker:foldlevel=0

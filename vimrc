" Plug {{{
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-unimpaired'
Plug 'lervag/vimtex'
Plug 'vim-scripts/a.vim'
Plug 'aklt/plantuml-syntax'
Plug 'wting/rust.vim'
Plug 'cyberkov/openhab-vim'

" Unix only plugins:
if has('unix')
    Plug 'Valloric/YouCompleteMe'
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
endif

call plug#end()
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
if has('gui_running')
    set background=light
else
    set background=dark
    set t_Co=16
    let g:solarized_termcolors=16
    let g:solarized_termtrans=1
endif
colorscheme solarized

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" guifont
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline

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

"" Maximize window on start
"if has("gui_running")
"  " GUI is running or is about to start.
"  " Maximize gvim window (for an alternative on Windows, see simalt below).
"  set lines=999 columns=999
"else
"  " This is console Vim.
"  if exists("+lines")
"    set lines=50
"  endif
"  if exists("+columns")
"    set columns=100
"  endif
"endif
"" }}}
"
" vim-airline {{{
set laststatus=2
let g:airline_powerline_fonts=1
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
let g:ycm_server_python_interpreter='/usr/bin/python3'
" }}}

" clang-format {{{
autocmd FileType cpp nnoremap <buffer> <C-K> :%pyf /usr/share/clang/clang-format.py<cr>
autocmd FileType cpp inoremap <C-K> <c-o> :%pyf /usr/share/clang/clang-format.py<cr>
" }}}

" latexindent {{{
autocmd FileType tex nnoremap <buffer> <C-K> :!latexindent -s -w %<cr>
autocmd FileType tex inoremap <buffer> <C-K> <c-o> :!latexindent -s -w %<cr>
" }}}

" vimtex {{{
" Use ycm for completion
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
    \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
    \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
    \ 're!\\hyperref\[[^]]*',
    \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
    \ 're!\\(include(only)?|input){[^}]*',
    \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
    \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
    \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
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

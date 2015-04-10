" ******************************************************************************
" First install and config all plugins. VUNDLE
" ******************************************************************************
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'https://github.com/bling/vim-airline'
Plugin 'https://github.com/vim-scripts/a.vim'
Plugin 'https://github.com/Rip-Rip/clang_complete'
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'https://github.com/Raimondi/delimitMate'
Plugin 'https://github.com/xaizek/vim-inccomplete'
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/garbas/vim-snipmate'
Plugin 'https://github.com/scrooloose/syntastic'
Plugin 'https://github.com/majutsushi/tagbar'
Plugin 'https://github.com/tomtom/tlib_vim'
Plugin 'https://github.com/marcweber/vim-addon-mw-utils'
Plugin 'https://github.com/jnurmine/Zenburn'
Plugin 'https://github.com/altercation/vim-colors-solarized'

" The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

" ******************************************************************************
" Basci setup
" ******************************************************************************
set exrc            " Enable external config.
set secure          " Don't allow all comands from extern config.
set tabstop=4       " How big tab key is.
set softtabstop=4   " After how many columns tab has to stop.
set shiftwidth=4    " Autoidentation?
set noexpandtab
set smartindent     " Auto-indent for a c-like
set backspace=indent,eol,start " Make Backspace even in eol like situations.
set linebreak

set ignorecase      " Makes searching easier...
set smartcase       " ...and smarter.
set incsearch       " Search in-time.
set hlsearch        " Highlight results

set ruler           " Show column number.
set hidden          " Allows easy switching between buffers.

" set laststatus=2	" Show status bar (if no air-line installed).
set laststatus=0

syntax on
syntax enable
filetype plugin on

" ******************************************************************************
" " Aestetics (first line has to be first also for powerLine).
" ******************************************************************************
set t_Co=256        " Mostly for Zenburn, but can affect other things too.
let g:solarized_termcolors=256 " If Slarized is used.
set colorcolumn=81
set background=dark
colors zenburn
"set background=light
"colors solarized
set showtabline=2   " Alway show tabs (w/o PL > buffers)
set number          " Line numbers.

" ******************************************************************************
" Plugins configurations.
" ******************************************************************************
" *** NERDTree
" If only NerdTree left open, close it.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" *** Airline / in case of PowerLine problems.
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" *** Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" I have set almost all off, for faster working with big projects.
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" *** Clang
let g:clang_library_path='/usr/lib/llvm-3.5/lib'
" *** Clang config
let g:clang_complete_auto = 1
let g:clang_use_library = 1
let g:clang_debug = 1
let g:clang_user_options='-I/usr/include/c++/4.8.2/ || exit 0'
let g:clang_complete_copen=1
let g:clang_hl_errors=1

" *********************************************************
" Key bindings
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
map <F10> :wqa<CR>
imap <F10> <Esc>:wqa<CR>
map <F2> :NERDTree<CR>:copen 10<CR><C-w><C-w><C-w><C-w>
map <F3> :Tagbar<CR>
map <F5> :!clear && ./a.out<CR>
map <F7> :w<CR>:make<CR>
map <F9> :nohlsearch<CR>
" Buffers navigation
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>
nnoremap <C-x> :Bclose<CR>
" Easier searching open buffers.
nmap ; :CtrlPBuffer<CR>
" Multiple windows navigation
noremap <C-Left> :wincmd h<CR>
noremap <C-Right> :wincmd l<CR>
noremap <C-Up> :wincmd k<CR>
noremap <C-Down> :wincmd j<CR>
" Moving lines feature
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" Navigation in wrap mode.
noremap j gj
noremap k gk
noremap $ g$
noremap 0 0k
" Go to tag from tag file.
map <C-\> :exec("tag ".expand("<cword>"))<CR>
" Open .vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>
" Show whitespaces
nmap <leader>l :set list!<CR>
" Clear whitespaces
nmap <leader>cw :%s/\s\+$//e<CR>

" *********************************************************
" Others

"Source the vimrc file after saving it
if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif


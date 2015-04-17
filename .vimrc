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

call vundle#end()            " required
filetype plugin indent on    " required

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just

" ******************************************************************************
" Basic setup.
" ******************************************************************************
set exrc            " Enable external config.
set secure          " Don't allow all comands from extern config.
set tabstop=4       " How big tab key is.
set softtabstop=4   " After how many columns tab has to stop.
set shiftwidth=4    " Autoidentation?
set expandtab		" Tab to spaces.
set smartindent     " Auto-indent for a c-like
set backspace=indent,eol,start " Make Backspace even in eol like situations.
set linebreak
set ignorecase      " Makes searching easier...
set smartcase       " ...and smarter.
set incsearch       " Search in-time.
set hlsearch        " Highlight results
set ruler           " Show column number.
set hidden          " Allows easy switching between buffers.
set number          " Line numbers.

syntax on
syntax enable

" ******************************************************************************
" " Aestetics (first line has to be first also for powerLine).
" ******************************************************************************
set term=xterm
set t_Co=256        " Mostly for Zenburn, but can affect other things too.
let g:solarized_termcolors=256 " If Slarized is used.
set colorcolumn=81  " Mark column 81.
set background=dark
colors zenburn
"set background=light
"colors solarized

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
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" I have set almost all off, for faster working with big projects.
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" *** Clang
let g:clang_library_path='/usr/lib/x86_64-linux-gnu'
" *** Clang config
let g:clang_complete_auto = 1
let g:clang_use_library = 1
let g:clang_debug = 1
let g:clang_user_options='-I/usr/include/c++/4.8.2/ || exit 0'
let g:clang_complete_copen=1
let g:clang_hl_errors=1

" ******************************************************************************
" Key bindings
" ******************************************************************************
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
vmap <c-s> <Esc>:w<CR>a
nmap <F10> :wqa<CR>
imap <F10> <Esc>:wqa<CR>
vmap <F10> <Esc>:wqa<CR>
map <F2> :NERDTree<CR>:copen 10<CR><C-w><C-w><C-w><C-w>
map <F3> :NERDTreeClose<CR>:cclose<CR>
map <F4> :Tagbar<CR>
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
nmap <leader>v :edit $MYVIMRC<CR>
" Show whitespaces
nmap <leader>l :set list!<CR>
" Clear whitespaces
nmap <leader>cw :%s/\s\+$//e<CR>
" Show/hide line numbers.
nmap <leader>n :set number!<CR>
" Toggle paste mode.
nmap <leader>p :set paste!<CR>
" Toggle 81 columns mar.
nmap <leader>8a :set colorcolumn=81<CR>
nmap <leader>8d :set colorcolumn=0<CR>

" ******************************************************************************
" Others
" ******************************************************************************

"Source the vimrc file after saving it
if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

" ******************************************************************************


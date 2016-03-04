" Fix to some error (with GitGutter asaik)
set shell=/bin/bash
" ******************************************************************************
" First install and config all plugins. VUNDLE
" ******************************************************************************
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'https://github.com/gmarik/Vundle.vim'
Plugin 'https://github.com/bling/vim-airline'
Plugin 'https://github.com/vim-airline/vim-airline-themes'
"Plugin 'https://github.com/Lokaltog/vim-powerline'
Plugin 'https://github.com/vim-scripts/a.vim'
Plugin 'https://github.com/Rip-Rip/clang_complete'
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'https://github.com/Raimondi/delimitMate'
Plugin 'https://github.com/xaizek/vim-inccomplete'
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/garbas/vim-snipmate'
" Plugin 'https://github.com/scrooloose/syntastic'
Plugin 'https://github.com/majutsushi/tagbar'
Plugin 'https://github.com/tomtom/tlib_vim'
Plugin 'https://github.com/marcweber/vim-addon-mw-utils'
Plugin 'https://github.com/jnurmine/Zenburn'
Plugin 'https://github.com/altercation/vim-colors-solarized'
Plugin 'https://github.com/airblade/vim-gitgutter'
Plugin 'https://github.com/tpope/vim-fugitive'
Plugin 'https://github.com/MattesGroeger/vim-bookmarks'
Plugin 'https://github.com/Chiel92/vim-autoformat'
Plugin 'https://github.com/schickling/vim-bufonly'
Plugin 'https://github.com/vim-scripts/dbext.vim'
" Conque at this moment has an issue with this repo, might need to get from
" the other source (official one).
Plugin 'https://github.com/vim-scripts/Conque-Shell'
Plugin 'https://github.com/vim-ctrlspace/vim-ctrlspace'
Plugin 'https://github.com/tomasr/molokai'
" Those two helps navigate, and are kinda good, but for now I do not use them.
"Plugin 'https://github.com/goldfeld/vim-seek'
"Plugin 'https://github.com/easymotion/vim-easymotion'

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
set copyindent      " Take indentation from last line.
set linebreak
set ignorecase      " Makes searching easier...
set smartcase       " ...and smarter.
set incsearch       " Search in-time.
set hlsearch        " Highlight results.
set ruler           " Show column number.
set hidden          " Allows easy switching between buffers.
set number          " Line numbers.
" set nobackup
set noswapfile
set foldenable          " Enable folding.
set foldmethod=syntax   " Enable folding based on syntax.
set foldlevelstart=99   " Start out with everything unfolded.
set scrolloff=3
set cursorline
set ttyfast
set fillchars=vert:│
set relativenumber        " Show relative numbers of lines

" Show clock when there is no statusline
set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

syntax on
syntax enable

"set colorcolumn=81  " Mark column 81.
set background=dark
colors molokai
"colors zenburn
" Transparetn bg
hi Normal ctermbg=none
" Easy to see visual selection
hi Visual term=reverse cterm=reverse guibg=Grey 
"set background=light
"colors solarized

" ******************************************************************************
" Plugins configurations.
" ******************************************************************************
" *** NERDTree
" If only NerdTree left open, close it.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" *** Powerline
" let g:Powerline_symbols = 'fancy'
" *** Airline / in case of PowerLine problems.
let g:airline_theme = 'dark'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
""let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
""let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
""let g:airline_symbols.paste = 'Þ'
""let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
let g:airline_powerline_fonts = 1
" Add clock
let g:airline_section_y = airline#section#create(['ffenc','%{strftime("%H:%M")}'])

" *** Syntastic Config
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" I have set almost all off, for faster working with big projects.
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0

" *** Clang
let g:clang_library_path='/usr/lib/x86_64-linux-gnu'
" *** Clang config
let g:clang_complete_auto = 1
let g:clang_use_library = 1
let g:clang_debug = 1
let g:clang_user_options='-I/usr/include/c++/4.8.2/ || exit 0'
let g:clang_complete_copen=1
let g:clang_hl_errors=1

" *** Bookmarks
let g:bookmark_save_per_working_dir = 1
let g:bookmark_aut_save = 1

" *** dbext " Don't want to public password, dummy!
if filereadable("dbSettings.vim")
    source dbSettings.vim
endif
" *** GitGutter
" As there was some error when starting Vim
let g:gitgutter_realtime = 0 

" ******************************************************************************
" Key bindings
" ******************************************************************************
"nmap <c-s> :w<CR>
"imap <c-s> <Esc>:w<CR>a
"vmap <c-s> <Esc>:w<CR>a
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
nnoremap <leader>j :CtrlSpaceGoUp<CR>
nnoremap <leader>k :CtrlSpaceGoDown<CR>
nnoremap <C-x> :Bclose<CR>
" Moving lines feature
" Normal mode
nnoremap <C-n> :m .+1<CR>==
nnoremap <C-b> :m .-2<CR>==
" Insert mode
inoremap <C-n> <ESC>:m .+1<CR>==gi
inoremap <C-b> <ESC>:m .-2<CR>==gi
" Visual mode
vnoremap <C-n> :m '>+1<CR>gv=gv
vnoremap <C-b> :m '<-2<CR>gv=gv
" Navigation in wrap mode.
noremap j gj
noremap k gk
noremap $ g$
noremap 0 0k
" Go to tag from tag file. // it seems that def is c ]
" map <C-\> :exec("tag ".expand("<cword>"))<CR>
" Find word in cpp, h and c files.
map <C-F> :execute "vimgrep /" . expand("<cword>") . "/ **/*.cpp **/*.h **/*.c **/*.cc" <Bar>
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
" Open Files in NERDTree.
map <leader>f :NERDTreeFind<CR>
" Save bookmarks
map ms :BookmarkSave .vim-bookmarks<CR> 
" Faster scrolling
nnoremap <C-E> 3<C-E>
nnoremap <C-Y> 3<C-Y>
" Show status line
map <leader>sl :set laststatus=2<CR>

" Searching tool.
" Netxt & previous element.
noremap <leader>[ :cp<CR>
noremap <leader>] :cn<CR>
" Copy-paste
vmap <leader>c "+y
nmap <leader>c "+yiw
map <leader>p "+p
" Create Tags - required exuberant-ctags
nmap <leader>tag :!ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f tags .<CR>

" Lets try it the 'right' way
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Reload .vimrc
map <leader>vim :source $MYVIMRC<CR>

map <C-l> :wincmd l<CR>
map <C-h> :wincmd h<CR>
map <C-j> :wincmd j<CR>
map <C-k> :wincmd k<CR>

" ******************************************************************************
" Others
" ******************************************************************************

"Source the vimrc file after saving it
"if has("autocmd")
"	autocmd bufwritepost .vimrc source $MYVIMRC
"endif

" ******************************************************************************


" Fix to some error (with GitGutter asaik).
set shell=/bin/bash
" ******************************************************************************
" First install and config all plugins. VUNDLE
" ******************************************************************************
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" # The plugin to rule them all, it should be installed manually.
Plugin 'https://github.com/gmarik/Vundle.vim'

" # Neat and informative tabs and status bars (lighter than PowerLine)
Plugin 'https://github.com/bling/vim-airline'
Plugin 'https://github.com/vim-airline/vim-airline-themes'

" # Easy "search-everywhere plugin", to heavy for current use.
"Plugin 'https://github.com/kien/ctrlp.vim'
" # File system explorer 
Plugin 'https://github.com/scrooloose/nerdtree'

" # Auto end to quotes and braces (based on file type)
Plugin 'https://github.com/Raimondi/delimitMate'
" # Nice snippet handling tool, not used to often 
" Plugin 'https://github.com/garbas/vim-snipmate'
" # Big syntax checker tool, good if Vim used as IDE
" Plugin 'https://github.com/scrooloose/syntastic'
" # Displays class description view based on tags
" Plugin 'https://github.com/majutsushi/tagbar'
" # Easy bookmark managements, good for IDE
" Plugin 'https://github.com/MattesGroeger/vim-bookmarks'
" # Autoformat code, IDE functionality
" Plugin 'https://github.com/Chiel92/vim-autoformat'

" # Utility plugin used by other, mostly IDE-like, plugins
Plugin 'https://github.com/tomtom/tlib_vim'
" # Utility plugin used by other, mostly IDE-like, plugins
Plugin 'https://github.com/marcweber/vim-addon-mw-utils'

" # Themes
Plugin 'https://github.com/jnurmine/Zenburn'
Plugin 'https://github.com/tomasr/molokai'
Plugin 'https://github.com/altercation/vim-colors-solarized'

" # Git plugins, I am using gitgutter, but fugitive might be better
Plugin 'https://github.com/airblade/vim-gitgutter'
Plugin 'https://github.com/tpope/vim-fugitive'

" # Close all but this buffer, I don't too often
Plugin 'https://github.com/schickling/vim-bufonly'

" # Good db connection plugin
Plugin 'https://github.com/vim-scripts/dbext.vim'

" # Integration with tmux
Plugin 'https://github.com/christoomey/vim-tmux-navigator'

" # CSV helping 
" Plugin 'https://github.com/chrisbra/csv.vim'

" Those two helps navigate, and are kinda good, but for now I do not use them.
"Plugin 'https://github.com/goldfeld/vim-seek'
"Plugin 'https://github.com/easymotion/vim-easymotion'

" # C++ coding helpers
"Plugin 'https://github.com/Rip-Rip/clang_complete'
"Plugin 'https://github.com/xaizek/vim-inccomplete'
"Plugin 'https://github.com/vim-scripts/a.vim'
"

call vundle#end()            " required
filetype plugin indent on    " required

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just

" ******************************************************************************
" Basic setup.
" ******************************************************************************
set t_Co=256

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
set ttyfast
set fillchars=vert:│
set relativenumber        " Show relative numbers of lines
set wildmenu
set wildmode=list:longest,full
"set esckeys " IF no errors with esc key, delete this line.
set timeoutlen=1000 ttimeoutlen=0
set wildmenu
"set cursorline
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" Show clock when there is no statusline
set ruler
"set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

syntax on
syntax enable

"set colorcolumn=81  " Mark column 81.
set background=dark
"colors molokai
colors zenburn
" Transparetn bg
hi Normal ctermbg=none
" Easy to see visual selection
hi Visual term=reverse cterm=reverse guibg=Grey 
"set background=light
"colors solarized

" Prevent VIM from clearing clipboard after exiting the VIM.
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" Change annoying braces highliting
highlight MatchParen cterm=bold ctermfg=blue ctermbg=none

" ******************************************************************************
" Plugins configurations.
" ******************************************************************************
" *** Ctrl-P plugin / disabled because of heaviness and not used to often
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP :pwd'
"let g:ctrlp_cmd = 'CtrlPLastMode'
"let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
"let g:ctrlp_working_path_mode = 'ra'
"set <M-p>=p
"nmap <M-p> :CtrlPBuffer<CR>

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
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_powerline_fonts = 1
" Add clock
"let g:airline_section_y = airline#section#create(['ffenc','%{strftime("%H:%M")}'])

" *** Syntastic Config
"set statusline+=%#warningmsg#
"set statusline+=%*
"
"set statusline+=%{SyntasticStatuslineFlag()}
" I have set almost all off, for faster working with big projects.
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0

" *** Clang / Disabled because not much c++ coding anymore
"let g:clang_library_path='/usr/lib/llvm-3.5/lib/'
" *** Clang config
"let g:clang_complete_auto = 1
"let g:clang_use_library = 1
""let g:clang_complete_copen=1
""let g:clang_hl_errors=1
""let g:clang_periodic_quickfix=1
"let g:clang_close_preview=1
"let g:clang_debug = 1
"let g:clang_user_options='-I/usr/include/c++/4.8.4/ || exit 0'
"let g:clang_complete_copen=1
"let g:clang_hl_errors=1
"let g:clang_auto_user_options=".clang_complete, path, compile_commands.json"

" *** Bookmarks
let g:bookmark_save_per_working_dir = 1
let g:bookmark_aut_save = 1

" *** dbext " Don't want to public password, dummy!
if filereadable("~/.vim/dbSettings.vim")
    source ~/.vim/dbSettings.vim
endif

" *** GitGutter
" As there was some error when starting Vim
let g:gitgutter_realtime = 0 

" ******************************************************************************
" Key bindings
" ******************************************************************************
" *** Commont files operatoins
nmap <C-s> :w<CR>
imap <C-s> <C-o>:w<CR>
vmap <C-s> <Esc>:w<CR> 
map <leader>n :enew<CR>

" *** F-keys mapping (to be abandond in future)
nmap <F10> :wqa<CR>
imap <F10> <Esc>:wqa<CR>
vmap <F10> <Esc>:wqa<CR>
map <F2> :NERDTree<CR>:copen 10<CR><C-w><C-w><C-w><C-w>
map <F3> :NERDTreeClose<CR>:cclose<CR>
map <F4> :Tagbar<CR>
map <F5> :!clear && ./a.out<CR>
map <F7> :w<CR>:make<CR>
" I think it is too far..
"map <F9> :nohlsearch<CR>

map ZX :qa!<CR>
map XX :Bclose!<CR>

" Problem with mapping - no free, suitable keys left!
" *** Moving lines feature
" Normal mode
"nnoremap <C-j> :m .+3<CR>==
"nnoremap <C-k> :m .-2<CR>==
" Insert mode
"inoremap <C-j> <ESC>:m .+1<CR>==gi
"inoremap <C-k> <ESC>:m .-2<CR>==gi
" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"Navigation in insert mode (ugly?)
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-h> <C-o>h
imap <C-l> <C-o>l

" *** Apparance 
" Show whitespaces
nmap <leader>l :set list!<CR>
" Clear whitespaces
nmap <leader>cw :%s/\s\+$//e<CR>
" Toggle 81 columns mar.
nmap <leader>8a :set colorcolumn=81<CR>
nmap <leader>8d :set colorcolumn=0<CR>
" Show status line
map <leader>sl :set laststatus=2<CR>
" Toggle NerdTree
" Align plugin is using this mapping
"nmap <leader>tt :NERDTreeToggle<CR>
nmap <leader>cc :copen<CR>

" *** Searching tools
" Netxt & previous element.
noremap <leader>[ :cp<CR>
noremap <leader>] :cn<CR>
" Open Files in NERDTree.
map <leader>f :NERDTreeFind<CR>
" Find word in cpp, h and c files.
map <C-F> :execute "vimgrep /" . expand("<cword>") . "/ **/*.cpp **/*.h **/*.c **/*.cc" <Bar>
" Create Tags - required exuberant-ctags
nmap <leader>tag :!ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f tags .<CR>
" Go to tag from tag file.  " Not sure if c-] does the same (uses vim tag engine?)
map <C-B> :exec("tag ".expand("<cword>"))<CR>
" Save bookmarks
map ms :BookmarkSave .vim-bookmarks<CR> 
" No highlight search results
map <leader>/ :nohlsearch<CR>

" *** Copy-paste
vmap <C-c> "+y
nmap <C-c> "+yiw
map <leader>p "+p

" Go to left and right buffer
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" *** Navigation
" Windows navigation / integrated with tmux?
set <M-l>=l
map <M-l> :wincmd l<CR>
set <M-h>=h
map <M-h> :wincmd h<CR>
set <M-j>=j
map <M-j> :wincmd j<CR>
set <M-k>=k
map <M-k> :wincmd k<CR>
map <C-w><C-w> :close<CR>

" Resive window / buggy
"nnoremap <silent> <leader><up> :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> <leader><down> :exe "resize " . (winheight(0) * 2/3)<CR>
"nnoremap <silent> <leader><right> :exe "vertical resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> <leader><left> :exe "vertical resize " . (winheight(0) * 2/3)<CR>
" Buffers navigation
nnoremap <leader>j :CtrlSpaceGoUp<CR>
nnoremap <leader>k :CtrlSpaceGoDown<CR>
nnoremap <C-x> :Bclose<CR>
" Faster scrolling
nnoremap <C-E> 3<C-E>
nnoremap <C-Y> 3<C-Y>
" Navigation in wrap mode.
noremap j gj
noremap k gk
noremap $ g$
noremap 0 g0

" SQL helpers
nmap <leader>ss :set syntax=sql<CR>:DBPromptForBufferParameters<CR>
nmap <leader>sct :DBCompleteTables<CR>
nnoremap <C-g> :DBExecSQLUnderCursor<CR>zz
inoremap <C-g> <C-o>:DBExecSQLUnderCursor<CR>zz

" *** Update .vimrc
nmap <leader>vv :edit $MYVIMRC<CR>
map <leader>vim :source $MYVIMRC<CR>
map <leader>json V:!python -m json.tool<CR>
map <leader>xml V:!xmllint --format -<CR>

" Because of DBExt plugin
"iunmap <Tab>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

set mouse=a

" Markdown helper
noremap <leader>m1 yyp<c-v>$r=
noremap <leader>m2 yyp<c-v>$r-
noremap <leader>md :put =strftime('%Y-%m-%d')<CR>

set foldmethod=syntax
let xml_syntax_folding=1 

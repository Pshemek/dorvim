" Make it mouse-friendly
source $VIMRUNTIME/mswin.vim
" Hide menu bar
set guioptions -=m
" Hide toolbar
set guioptions -=T

"AirlineToggle

nmap <C-t> :enew<CR>

" ==============================================================================
" This function will save and load Vim sessions + unnamed buffers.
" Taken from: https://vi.stackexchange.com/a/8296
" ==============================================================================
function! MkSession(...)
    " Handle the argument
    if empty(a:000)
        let filename = "Session.vim"
    else
        let filename = fnameescape(a:1)
    endif

    " Create the session file according to the argument passed
    execute 'mksession! ' . filename

    " The list containing the lines on the unnmaed buffers
    let noname_buffers = []

    " Get the lines of all the unnamed buffers in the list
    execute "silent! bufdo \| if expand('%')=='' \| call add(noname_buffers, getline(1, '$')) \| endif"

    " For each set of lines
    " Add into the session file a line creating an empty buffer
    " and a line adding its content
    for lines in noname_buffers
        call system('echo "enew" >> '.filename)
        call system('echo "call append(0, [\"'. join(lines, '\",\"') .'\"])" >>'. filename)
    endfor

endfunction

command! -nargs=? Mksession call MkSession(<f-args>)

autocmd VimLeave * Mksession ~/.vim/session.gvim
autocmd VimEnter * source ~/.vim/session.gvim
" ==============================================================================

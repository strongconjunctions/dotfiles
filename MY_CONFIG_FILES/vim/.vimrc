set nocompatible
syntax enable


" ------------ VISUALS ----------- "
colorscheme atom-dark-256           " or 'slate'

set guifont=Hack:h15  " if font has spaces, delimit with underscore

set guioptions-=l       " to remove left handed scrollbar
     
set guioptions-=L       " this is to remove the left handed scrollbar
                        " on split srcreen
set guioptions-=r
set guioptions-=R


set t_CO=256            " this forces 256 colors

set linespace=15        " only works in a GUI editor (not a basic console)



set backspace=indent,eol,start      " Allows the use of backspace on indents, enf of line, start
let mapleader = ','                 " The default leader is /, but we specified comma as the default
set number                          " This activates line numbers

" Tab configs
set expandtab                       " expands your Tabs into spaces
set tabstop=4
set softtabstop=4
set autoindent
set shiftwidth=4


nmap <Leader><space> :nohlsearch<cr> 


" Our default encryption method (which you can change to something else)
set cryptmethod=blowfish2


" Always show the status line
set laststatus=2

" Format the status line
" Note that you can put a lot of things in your status bar
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE '
    en
    return ''
 endfunction



" ------------------ SEARCH -------------------- "
set hlsearch                        " This highlights all instances of a searched word if
                                    " you hit:   /<searched word> + Enter
set incsearch                       " Sets the incremental search


" Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>    " if you hit ",<space>" (or "/<space>"), depending on
                                        " what you set as the <Leader>, you will de-highlight
                                        " all searched terms


" ------------- MY CUSTOM SETTINGS --------------"
" JSON Formatting
map pj !python -m json.tool<CR>     " when in visual mode, if you press 'pj', it 
                                    " will format your Python dict into a JSON


" XML Formatting
map xm !xmllint --format --recover -<CR>


" Pathogen
execute pathogen#infect()

" Other general Vim configs
syntax on
set showmatch                       " show matching brackets
set ignorecase                      " Do case insensitive matching
set incsearch                       " show partial matches for a search phrase
set nopaste                         " allows you to paste code without Vim trying to format it
set number" show line numbers
set undolevels=1000" how many undos you can make


" Have Vim jump to the last position when opening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif



" ------------ MY MAPPINGS ----------- "
" press ',ev' to open .vimrc in new tab for editing. When finished, save, and 
" then run :bd to close the tab buffer
nmap ,ev :tabedit $MYVIMRC<cr>      " <cr> = Enter (it will auto-enter this command)

" c is 'CTRL'. So if you press CTRL+j, you will move 4 spaces down,
" and the same applies for every other key
nmap <c-j> 4j
nmap <c-k> 4k
nmap <c-h> 4h
nmap <c-l> 4l



" ------------------- MY AUTO-COMMANDS ----------------- "
" Automatically sources the .vimrc file on save
" autocmd BufWritePost .vimrc source %    " it listens to when we write to a buffer


" Automatically source the .vimrc file on save.
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END


" Word Processor mode setup (perfect for non-program writing)
func! WordProcessorMode() 
    setlocal formatoptions=1 
    setlocal noexpandtab 
    setlocal textwidth=80
    setlocal smartindent
    map j gj 
    map k gk
    setlocal spell spelllang=en_us 
    set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
    set complete+=s
    set formatprg=par
    setlocal wrap 
    setlocal linebreak 
endfu
com! WP call WordProcessorMode()    " this line activates word processor 
                                    " mode via `WP` command



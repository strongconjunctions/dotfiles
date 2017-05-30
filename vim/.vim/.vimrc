syntax on
syntax enable
set nocompatible




" ------- VUNDLE ------ "
so ~/.vim/plugins.vim       " this is a sourced link to Vundle plugin file

" --------------------- "




" ------------ VISUALS ----------- "
colorscheme slate   " or 'atom-dark-256'
set guifont=Hack:h15        " if font has spaces, delimit with underscore
set guioptions-=l           " to remove left handed scrollbar
set guioptions-=L           " this is to remove the left handed scrollbar
set guioptions-=r
set guioptions-=R

set guioptions-=e           " No GUI tabs
set t_CO=256                " this forces 256 colors
set linespace=15            " only works in a GUI editor (not a basic 
                            " console)
                            
" Changes the vertical split line from dotted to nothing
" Alternatively you can change it to a solid line, by adding | after
" the \ symbol. Instead we just have an empty space after \
set fillchars=vert:\| 
highlight VertSplit cterm=NONE ctermfg=NONE ctermbg=NONE 
highlight Search ctermfg=Yellow ctermbg=NONE cterm=bold,underline
highlight Normal guifg=White guibg=Black
highlight LineNr ctermbg=NONE  ctermfg=NONE
" ------------- END -------------- "





" ------------ MY MAPPINGS ----------- "

" Add simple highlight removal
" if you hit ',<space>' (or '/<space>'), depending on what you set as 
" the <Leader>, you will de-highlight all searched terms
nmap <Leader><space> :nohlsearch<cr>
" This will bind ':NERDTreeToggle' sidebar command to CTRL+1
nmap <c-t> :NERDTreeToggle<cr>

" press ',ev' to open .vimrc in new tab for editing. When finished, save, and 
" then run :bd to close the tab buffer
" <cr> = Enter (it will auto-enter this command)
nmap ,ev :tabedit $MYVIMRC<cr>      

" now CTRL+r will look for buffer tags: functions, etc
" So if your Python has like 5 functions, it will only focus on 
" function names.
nmap <c-r> :CtrlPBufTag<cr>

" --------------- END ------------------- "




" ------------------ PLUGIN SETTINGS ----------------- "
" This ignores certain dirs and files when browsing thorugh them with CtrlP
let g:ctrlp_custom_ignore = 'DS_Store\|git'  
" This controls the position, placement, and order of search in the 
" drop down that opens up with CtrlP. It also limits the number of
" results to 15.
let g:ctrlp_match_window = "top,order:ttb,min:1,max:15,result:15"
" With this in place, if you hit '-' you will be presented with a 
" NERDTree file structure of the current dir.
let NERDTreeHijackNetrw = 0

" Settings for search/replace
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'
" ------------------------ END ----------------------- "




" ---------------- ENCRYPTION --------------- "
" Our default encryption method (which you can change to something else)
set cryptmethod=blowfish2
" ------------------- END ------------------- "




" --------- STATUS LINE ---------- "
" Always show the status line
set laststatus=2

" Format the status line
" Note that you can put a lot of things in your status bar
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" -------------- END ------------- "




" ------------------ SEARCH -------------------- "
set hlsearch                        " This highlights all instances of a searched word if
                                    " you hit:   /<searched word> + Enter
set incsearch                       " Sets the incremental search
" ------------------- END ---------------------- "




" ------------- MY CUSTOM SETTINGS --------------"
" JSON Formatting
map pj !python -m json.tool<CR>     " when in visual mode, if you press 'pj', it
                                    " will format your Python dict into a JSON
" XML Formatting
map xm !xmllint --format --recover -<CR>

" Pathogen
execute pathogen#infect()
" ------------------- END ---------------------- "




" -------------------- GENERAL SETTINGS -------------------- "
" Allows the use of backspace on indents, end of line, start
set backspace=indent,eol,start     
" The default leader is /, but we specified comma as the default
let mapleader = ','                 
" This activates line numbers
set number                          
" This sets relative line numbers
set relativenumber


" Tab configs
set expandtab                       " expands your Tabs into spaces
set tabstop=4
set softtabstop=4
set autoindent
set shiftwidth=4

" Other general Vim configs
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
" --------------------------- END -------------------------- "




" ------------------------ SPLIT ------------------------ "
" Here we create custom mappings for how to split the window

" This makes sure that whenever you create a split, it will below or to
" the right of the current one.
set splitbelow
set splitright
" this maps CTRL+j to what was CTRL+w+CTRL+j
nmap <c-j> <c-w><c-j>       
nmap <c-k> <c-w><c-k>
nmap <c-l> <c-w><c-l>
nmap <c-h> <c-w><c-h>
" -------------------------- END ------------------------ "


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


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE '
    en
    return ''
 endfunction
" ------------------------- END ------------------------ "







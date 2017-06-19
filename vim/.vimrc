set nocompatible            " makes sure that you're always in Vim mode 
                            " (and not Vi)



" --- FILETYPE --- "
filetype plugin indent on
" --- END --- "



" --- SYNTAX --- "
syntax on
syntax enable
set nowrap                  " won't automatically wrap lines on load
set fo-=t                   " won't wrap lines on typing

set thesaurus+=/usr/share/dict/eng_words.txt
set thesaurus+=/usr/share/dict/words.txt
" --- END --- "



" -------------------- GENERAL SETTINGS -------------------- "
" Allows the use of backspace on indents, end of line, start
set backspace=indent,eol,start     
" The default leader is /, but we specified comma as the default
" mapleader is very important, as it allows you to build custom mappings
let mapleader = ','                 

set autochdir                   " automatically changes your working directory
                                " to the file you're currently editing

set hidden                      " better handles multiple buffers
set ruler

"set number                     " This activates line numbers
set relativenumber              " This sets relative line numbers
set scrolloff=5                 " This will make sure that there is always at 
                                " least 5 lines between the cursor and the 
                                " window as you're scrolling with your cursor
"set foldmethod=indent          " my foldmethod
let g:SimpylFold_docstring_preview = 1      " preview docstrings when they're
                                            " folded
set scrolloff=5                 " This will make sure that there is always at 
                                " least 5 lines between the cursor and the 
                                " window as you're scrolling with your cursor
set wildmode=list:full          " Will show you a list of options when
                                " <Tab> autocompleting, but won't actually
                                " auto-insert them. And 'full' just gives
                                " you the full completion
set cursorline                  " Creates an underline under the
                                " line that you're on
set fileencoding=utf-8          " What format the file is written in
set encoding=utf-8              " What encoding is on the display
set noswapfile                  " Disables all swapping in Vim (that's 
                                " when a .swp copy of your file gets
                                " created when you work on a file). 
                                " In most cases you don't need a swap file
set nobackup
set nowritebackup


set virtualedit=all


" Folding
" These two option will make sure that your folds will open and close as your 
" cursor enters and leaves the fold area.
set foldopen=all                   
set foldclose=all
set foldlevel=1


" Tab configs
set expandtab                       " expands your Tabs into spaces
set tabstop=4
set softtabstop=4
set autoindent                      " same as smartindent
set shiftwidth=4
set shiftround                      " rounds the shift width to the closest
                                    " possible shift width (so if your line is
                                    " indented to 7 spaces, it will indent it 
                                    " by 1 more to reach 8; that is if 4 is
                                    " your default shift width)

" Other general Vim configs
set showmatch                       " show matching brackets
set ignorecase                      " Do case insensitive matching
set nopaste                         " allows you to paste code without Vim 
                                    " trying to format it
set undolevels=2000                 " how many undos you can make


" Have Vim jump to the last position when opening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" This sets the directory where to store history files (undo files)
set undodir=$HOME/.vim/.undo_files

" This will persist your file history between Vim sessions, allowing you to
" undo certain steps even after you reopen the file
if has('persistent_undo')
    set undofile
endif


" This allows the Visual mode selection to persist after performing a command
vmap <expr> > ShiftAndKeepVisualSelection(">", '[Vv]')
vmap <expr> < ShiftAndKeepVisualSelection("<", '[Vv]')

function! ShiftAndKeepVisualSelection(cmd, mode)
    set nosmartindent
    if mode() =~ '[Vv]'
        return a:cmd . ":set smartindent\<CR>gv"
    else
        return a:cmd . ":set smartindent\<CR>"
    endif
endfunction


" Dictionary word completion: Adds your local Unix English word dict
" to Vim's word completions
set dictionary+=/usr/share/dict/words      " autocomple using <CTRL-x><CTRL-k>

" --------------------------- END -------------------------- "





" ------------- WINDOW SETTINGS ------------- "
set winwidth=84                 " if you open a vertical window, then it's max
                                " width will be 84

set winheight=10                " sets the height of the window if it's not
                                " in focus. So if you have 2 Vim windows open
                                " then the one not in focus will resize to 10
                                " lines height. And all the unfocused windows
                                " will be reduced to 10 lines.

set winminheight=5

set winheight=1000              " window height when you only have 1 window
" ----------------- END --------------------- "





" ------- VUNDLE ------ "
so ~/.vim/plugins.vim       " this is a sourced link to Vundle plugin file
" --------------------- "




" ------------ VISUALS ----------- "
colorscheme cypherpunxxx  " or 'atom-dark-256', or 'slate', or 'Chasing_Logic'
                              " or 'Tomorrow-Night-Eighties', or 'Zenburn', or
                              " 'Spink', or 'radicalgoodspeed'

set vb                      " sets visual bell instead of audio one
set guifont=Hack:h15        " if font has spaces, delimit with underscore
set guioptions-=l           " to remove left handed scrollbar
set guioptions-=L           " this is to remove the left handed scrollbar
set guioptions-=r
set guioptions-=R

set guioptions-=e           " No GUI tabs
set t_CO=256                " this forces 256 colors
set linespace=15            " only works in a GUI editor (not a basic 
                            " console)


" set background=dark         " sets your theme to a dark version (if exists)

set visualbell              " instead of audio bell creates a visual flash
                            " when you do something wrong


" Options for a syntactic column on line 80
highlight ColorColumn ctermbg=red
"set colorcolumn=80
call matchadd('ColorColumn', '\%80v', 100)


" Changes the vertical split line from dotted to nothing
" Alternatively you can change it to a solid line, by adding | after
" the \ symbol. Instead we just have an empty space after \
"set fillchars=""
highlight VertSplit cterm=NONE ctermfg=NONE ctermbg=NONE 
highlight Search ctermfg=Yellow ctermbg=NONE cterm=bold,underline
highlight Normal guifg=White guibg=Black
highlight LineNr ctermbg=NONE  ctermfg=NONE
" ------------- END -------------- "





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



" --------- HELP ---------- "

" this will remap <CTRL-t> used to go back to the previous menu in help
" to <CTRL-[>
nnoremap <c-[> <c-t>
" --------- END ----------- "



" --------- STATUS LINE ---------- "
" Always show the status line
set laststatus=2

" Format the status line
" Note that you can put a lot of things in your status bar
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ Line:\ %l/%L\ Column:\ %c\ %p%%\ %y
" -------------- END ------------- "




" ------------------ SEARCH -------------------- "
set hlsearch                        " This highlights all instances of a 
                                    " searched word if you hit:   
                                    " /<searched word> + Enter

set incsearch                       " Sets the incremental search (it
                                    " auto-searches as you continue typing)

set smartcase                       " Allows you to perform smart searches
                                    " it only becomes case-sensitive if you
                                    " type an uppercase letter
" ------------------- END ---------------------- "





" ------------- MY CUSTOM SETTINGS --------------"
" This adds recursive (deep directory) search of files using the :find command
set path+=**

set showcmd                         " shows the current command in the bottom
                                    " right corner

" JSON Formatting
" When in visual mode, if you press 'pj', it  will format your Python dict 
" into a JSON
map pj !python -m json.tool<CR>    

" XML Formatting
map xm !xmllint --format --recover -<CR>

" Adds <...> to matching brackets list (so you can jump inside of them
" from opening bracket to closing bracket using the % key)
set matchpairs+=<:>

" Displays all matching files after <Tab>-completing your search
set wildmenu

command! MakeTags !ctags -R
" ------------------- END ---------------------- "





" ------------------------ SPLIT ------------------------ "
" Here we create custom mappings for how to split the window

" This makes sure that whenever you create a split, it will below or to
" the right of the current one.
set splitbelow
set splitright

" this mapping will allow you to navigate between splits using only
" commands like CTRL+k or CTRL+j, depending if your split is below, above
" to the right, etc
nnoremap <c-j> <c-w><c-j>       
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>
" -------------------------- END ------------------------ "





" ------------------- MY AUTO-COMMANDS ----------------- "
" Automatically sources the .vimrc file on save
" autocmd BufWritePost .vimrc source %    " it listens to when we write to a buffer
" Automatically source the .vimrc file on save.
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END


augroup JavaScriptCmds
    autocmd!
    set nowrap             " in case you don't want wrapping
    setlocal background=dark
    autocmd Filetype javascript nnoremap <leader>c I//<esc>
augroup end


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE '
    en
    return ''
 endfunction

 
" Word Processor mode setup (perfect for non-program writing)
func! WordProcessorMode() 
    setlocal formatoptions=1 
    setlocal noexpandtab 
    setlocal textwidth=80
    setlocal smartindent
    map j gj 
    map k gk
    setlocal spell spelllang=en_us 
    set complete+=s
    set formatprg=par
    setlocal wrap 
    setlocal linebreak 
endfu

command! ZP call WordProcessorMode()    " this line activates word processor 
                                        " mode via `WP` command
" ------------------------- END ------------------------ "




" ------------ MY MAPPINGS ----------- "

" Thesaurus autocompletion remapping from <CTRL-x><CTRL-t> to <SHIFT-TAB>
inoremap <s-tab> <c-x><c-t>


" Remapping of <Tab> to perform both tabbing and autocompletion
function! TabPlusAutocomplete()
    let col = col(".") - 1          " this checks which text column this it
    " Here we check that either the col is 0, or we grab the current line
    " and it's current column-1 (previous char) and we check that it's not
    " a keyword ('\k' in Vim's syntax); so it checks if the previous character
    " is a letter and not whitespace
    if !col || getline(".")[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
endfunction
" Note that the <c-r> inserts anything from the register
inoremap <tab> <c-r>=TabPlusAutocomplete()<cr>


" Navigation in Insert mode
inoremap <c-j> <c-o>j
inoremap <c-k> <c-o>k
inoremap <c-l> <c-o>l
inoremap <c-h> <c-o>h


" Disables the arrow keys (sorry, THIS IS VIM!!!)
" the <nop> assigns no action to all the navigation keys
noremap <left> <nop>
noremap <up> <nop>        
noremap <right> <nop>    
noremap <down> <nop>     


" Add simple highlight removal
" if you hit ',<space>' (or '/<space>'), depending on what you set as 
" the <Leader>, you will de-highlight all searched terms
nmap <Leader><space> :nohlsearch<cr>
" This will bind ':NERDTreeToggle' sidebar command to CTRL+1
nmap <c-t> :NERDTreeToggle<cr>


" Maps :sort function (for alphabetical sort)
vnoremap <Leader>s :sort<CR>


" Specifies indentation for these file types
au BufNewFile,BufRead *.js, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2



" Press ',ev' to open .vimrc in new tab for editing. When finished, save, and 
" then run :bd to close the tab buffer
" <cr> = Enter (it will auto-enter this command)
nmap ,ev :tabedit $MYVIMRC<cr>      


" CTRL+r will look for buffer tags: functions, etc
" So if your Python has 5 functions, it will only focus on 
" function names.
"nmap <c-r> :CtrlPBufTag<cr>


" If you type ',to', it will open a new tab
map ,to :tabedit<CR>


" This autocommand will use our custom subroutine to execute <C-W>T 
" on any newly opened help window, so that it would take up the entire
" space of the window, instead of 80%, leaving 20% to the currently opened
" file. This is just a cleaner way to view the :help file.
augroup HelpInTabs
    autocmd!
autocmd BufEnter *.txt call MaximizeHelpTab()
augroup END

" Will only apply to help files
function! MaximizeHelpTab()
if &buftype == 'help'
    " Converts the help window into a tab
    execute "normal \<C-W>T"
endif
endfunction


" Specifies indentation for these file types
au BufNewFile,BufRead *.js, *.css
\ set tabstop=2
\ set softtabstop=2
\ set shiftwidth=2
\ set number


" -- PYTHON -- "
" Will insert a comment # symbol at the start of the current line in a .py
" file
autocmd Filetype python nnoremap <buffer> <leader>c I# <esc>

" PEP-8 compliant indentation
au BufNewFile,BufRead *.py
\ set tabstop=4
\ set softtabstop=4
\ set shiftwidth=4
\ set textwidth=79
\ set expandtab
\ set autoindent

" enable all Python syntax highlighting features
let python_highlight_all = 1


" --------------- END ------------------- "



    


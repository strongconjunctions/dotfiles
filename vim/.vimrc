set nocompatible                " makes sure that you're always in Vim mode.
                                " (and not Vi)

" --- SYNTAX --- "
filetype plugin indent on
syntax on
syntax enable
set nowrap                      " won't automatically wrap lines on load
set fo-=t                       " won't wrap lines on typing

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
"set foldmethod=indent          " my foldmethod
let g:SimpylFold_docstring_preview = 1      " preview docstrings when they're
                                            " folded
set scrolloff=5                 " This will make sure that there is always at.
                                " least 5 lines between the cursor and the.
                                " window as you're scrolling with your cursor
set wildmode=list:full          " Will show you a list of options when
                                " <Tab> autocompleting, but won't actually
                                " auto-insert them. And 'full' just gives
                                " you the full completion
set cursorline                  " Creates an underline under the
                                " line that you're on
set fileencoding=utf-8          " What format the file is written in
set encoding=utf-8              " What encoding is on the display

set noswapfile                  " Disables all swapping in Vim (that's.
                                " when a .swp copy of your file gets
                                " created when you work on a file)..
                                " In most cases you don't need a swap file
set nobackup
set nowritebackup

setlocal spell spelllang=en_us        " sets the spelling check


" Allows you to position your cursor where there is no actual whitespace (so
" pretty much everywhere in your buffer). Sometimes it's a very handy option
" for editing a file (or even creating one).
"set virtualedit=all


" Folding
" These two option will make sure that your folds will open and close as your.
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
                                    " indented to 7 spaces, it will indent it.
                                    " by 1 more to reach 8; that is if 4 is
                                    " your default shift width)

" Other general Vim configs
set showmatch                       " show matching brackets
set ignorecase                      " Do case insensitive matching
set nopaste                         " allows you to paste code without Vim.
                                    " trying to format it
set undolevels=2000                 " how many undos you can make                                                                                                         


" Shows you trailing whitespace, and what kinds of characters (Tabs
" or spaces) are used
set listchars=tab:>~,nbsp:_,trail:.
set list


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
        return a:cmd . ":set smartindent\<cr>gv"
    else
        return a:cmd . ":set smartindent\<cr>"
    endif
endfunction


" Dictionary word completion: Adds your local Unix English word dict
" to Vim's word completions
set dictionary+=/usr/share/dict/words      " autocomple using <CTRL-x><CTRL-k>
" --------------------------- END -------------------------- "




" ------------- WINDOW SETTINGS ------------- "                                                                                                                           
set winwidth=84                 " if you open a vertical window, then it's max
                                " width will be 84

set winheight=15                " sets the height of the window if it's not
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
colorscheme cypherpunxxx        " atom-dark-256', or 'slate', or 'Chasing_Logic'
                                " or 'Tomorrow-Night-Eighties', or 'Zenburn', or
                                " 'Spink', or 'radicalgoodspeed', or
                                " 'cypherpunxxx', or 'obsidian', or 'ingretu',
                                " or 'material', or 'alduin', 'anderson',
                                " 'antares', 'apprentice', 'babymate256',
                                " 'badwolf', 'base', 'bwmenu', 
                                " 'bubblegum', 'bluez', 'blazer'


set guifont=Hack:h15            " if font has spaces, delimit with underscore
set guioptions-=l               " to remove left handed scrollbar
set guioptions-=L               " this is to remove the left handed scrollbar
set guioptions-=r
set guioptions-=R
set guioptions=i
set guioptions-=e               " No GUI tabs
set t_CO=256                    " this forces 256 colors
set linespace=15                " only works in a GUI editor (not a basic.
                                " console)


set background=dark             " sets your theme to a dark version (if exists)

set visualbell                  " instead of audio bell creates a visual flash
                                " when you do something wrong


" Set this to color highlight misspelled words when hitting ;s. To turn
" the highlighting off, hit ;s again.
nnoremap ;s  :set invspell spelllang=en<cr>
nnoremap <leader>zz z= 1<cr><cr>

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
" This ignores certain dirs and files when browsing through them with CtrlP
let g:ctrlp_custom_ignore = 'DS_Store\|git'

" This controls the position, placement, and order of search in the.
" drop down that opens up with CtrlP. It also limits the number of
" results to 15.
let g:ctrlp_match_window = "top,order:ttb,min:1,max:15,result:15"

" With this in place, if you hit '-' you will be presented with a.
" NERDTree file structure of the current dir.
let NERDTreeHijackNetrw = 0

" Settings for search/replace
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

let g:UltiSnipsExpandTrigger="<c-t><c-u>"
" ------------------------ END ----------------------- "



" ---------------- ENCRYPTION --------------- "
" Our default encryption method (which you can change to something else)
set cryptmethod=blowfish2
" ------------------- END ------------------- "



" --------- HELP ---------- "

" this will remap <CTRL-t> used to go back to the previous menu in help
" to <CTRL-\>
nnoremap <c-\> <c-t>
" --------- END --------- "


" --------- STATUS LINE ---------- "
" Always show the status line
set laststatus=2

" Format the status line
" Note that you can put a lot of things in your status bar
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ Line:\ %l/%L\ Column:\ %c\ %p%%\ %y
" -------------- END ------------- "



" ------------------ SEARCH -------------------- "
set hlsearch                        " This highlights all instances of a.
                                    " searched word if you hit:...
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
" When in visual mode, if you press 'pj', it  will format your Python dict.
" into a JSON
map pj !python -m json.tool<cr>....

" XML Formatting
map xm !xmllint --format --recover -<cr>

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
augroup END
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

command! ZP call WordProcessorMode()    " this line activates word processor.
                                        " mode via `WP` command
" ------------------------- END ------------------------ "




" ------------ MY MAPPINGS ----------- "

" Thesaurus autocompletion remapping from <CTRL-x><CTRL-t> to <SHIFT-TAB>
inoremap <s-tab> <c-x><c-t>

" This setting forbids you from using <backspace> in INSERT mode.
" Learn to edit in NORMAL mode, NOT in INSERT
"inoremap <backspace> <esc> :echo "EDIT IN NORMAL MODE, STUPID!"<cr>

" Remapping of <Tab> to perform both tabbing and autocompletion
function! TabPlusAutocomplete()
    let col = col(".") - 1          " this checks which text column this is

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


" A great and easy mapping to exit INSERT mode into NORMAL mode
inoremap jk <esc>

" Navigation in INSERT  mode
inoremap <c-j> <c-o>j
inoremap <c-k> <c-o>k
inoremap <c-l> <c-o>l
inoremap <c-h> <c-o>h

" Originally <c-k> allows you to enter Unicode characters as digraphs,
" but we remap it to <CTRL-e>
inoremap <c-e> <c-k>


" Disables the arrow keys (sorry, THIS IS VIM!!!)
noremap <left> :echo "ARE YOU AN IDIOT?"<cr>
noremap <up> :echo "ARE YOU AN IDIOT?"<cr>
noremap <right> :echo "ARE YOU AN IDIOT?"<cr>
noremap <down> :echo "ARE YOU AN IDIOT?"<cr>

inoremap <left> <esc> :echo "ARE YOU AN IDIOT?"<cr>
inoremap <up> <esc> :echo "ARE YOU AN IDIOT?"<cr>
inoremap <right> <esc> :echo "ARE YOU AN IDIOT?"<cr>
inoremap <down> <esc> :echo "ARE YOU AN IDIOT?"<cr>

" Add simple highlight removal
" if you hit ',<space>' (or '/<space>'), depending on what you set as.
" the <leader>, you will de-highlight all searched terms
nmap <leader><space> :nohlsearch<cr>

" This will bind ':NERDTreeToggle' sidebar command to CTRL+1
nmap <c-t> :NERDTreeToggle<cr>


" Maps :sort function (for alphabetical sort)
vnoremap <leader>s :sort<cr>


" Press ',ev' to open .vimrc in new tab for editing. When finished, save, and.
" then run :bd to close the tab buffer
" <cr> = Enter (it will auto-enter this command)
nnoremap <leader>ev :vs $MYVIMRC<cr>

" Quickly edit snippet files you need
nnoremap <leader>es :vs ~/.vim/snippets/


" CTRL+r will look for buffer tags: functions, etc
" So if your Python has 5 functions, it will only focus on.
" function names.
"nmap <c-r> :CtrlPBufTag<cr>


" If you type ',to', it will open a new tab
map ,to :tabedit<cr>


" Remapping the save command
nnoremap <leader>jj :w<cr>          " save buffer in normal mode
inoremap jj <esc>:w<cr>             " save buffer in insert mode


" This will jump you out of the current word, and put you in INSERT mode at the
" end of the line
inoremap ;; <esc><s-a>

" This autocommand will use our custom subroutine to execute <C-W>T.
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
autocmd FileType python nnoremap <buffer> <leader>c I# <esc>
" PEP-8 compliant indentation
au BufRead,BufNewFile *.py,*.pyw.
\ set tabstop=4
\ softtabstop=4
\ shiftwidth=4
\ textwidth=79
\ expandtab

" enable all Python syntax highlighting features
let python_highlight_all = 1

" --------------- END ------------------- "



" ------- ABBREVIATIONS -------- "

iabbrev adn and
iabbrev nad and
iabbrev Adn And
iabbrev Nad and
iabbrev ned end
iabbrev edn end
iabbrev menas means
iabbrev Menas means
iabbrev dont don't
iabbrev Dont Don't
iabbrev commnad command
iabbrev Commnad Command
iabbrev doen done
iabbrev si is
iabbrev Si Is
iabbrev Doen Done
iabbrev incldue include
iabbrev Incldue Include
iabbrev icnlde include
iabbrev Icnlde Include
iabbrev inclde include
iabbrev Inclde Include
iabbrev cahnge change
iabbrev Cahnge Change
iabbrev chnage change
iabbrev Chnage Change
iabbrev saem same
iabbrev Tou you
iabbrev tou you
iabbrev wtih with
iabbrev Wtih With
iabbrev wiht with
iabbrev Wiht With
iabbrev Saem same
iabbrev smae same
iabbrev Smae Same
iabbrev thta that
iabbrev Thta that
iabbrev taht that
iabbrev Taht That
iabbrev htat that
iabbrev Htat That
iabbrev calss class
iabbrev Calss Class
iabbrev fro for
iabbrev Fro For
iabbrev fucntion function
iabbrev Fucntion Function
iabbrev functon function
iabbrev Functon Function
iabbrev fnction function
iabbrev Fnction Function
iabbrev fo of
iabbrev Fo of
iabbrev whterh whether
iabbrev Whterh Whether
iabbrev whethr whether
iabbrev Whethr Whether
iabbrev Whther Whether
iabbrev whther whether
iabbrev thorugh through
iabbrev Thorugh Through
iabbrev Throguh Through
iabbrev throguh through
iabbrev thourgh through
iabbrev Thourgh Through
iabbrev first first
iabbrev Fisrt First
iabbrev waht what
iabbrev Waht What
iabbrev tehn then
iabbrev Tehn Then
iabbrev hte the
iabbrev Hte The
iabbrev teh the
iabbrev Teh The
iabbrev @@ strongconjunctions@gmail.com
iabbrev wsa was
iabbrev aws was
iabbrev Aws Was
iabbrev Wsa Was
iabbrev nto not
iabbrev Nto not
iabbrev whne when
iabbrev Whne When
iabbrev wehn when
iabbrev Wehn When
iabbrev thsi this
iabbrev Thsi This
iabbrev tihs this
iabbrev thna than
iabbrev Thna than
iabbrev naem name
iabbrev Naem Name
iabbrev nmae name
iabbrev Nmae Name
iabbrev anme name
iabbrev Anme Name
iabbrev anem name
iabbrev Anem Name
iabbrev anme name
iabbrev Anme Name
iabbrev aenm name
iabbrev Aenm Name
iabbrev fisrt first
iabbrev First First
iabbrev haev have
iabbrev Haev Have
iabbrev fiel file
iabbrev Fiel File
iabbrev flie file
iabbrev Flie File
iabbrev fodler folder
iabbrev Fodler Folder
iabbrev fuction function
iabbrev Fuction Function
iabbrev shoudl should
iabbrev Shoudl Should
iabbrev ANd And
iabbrev commadn command
iabbrev Commadn Command
iabbrev jsut just
iabbrev jstu just
iabbrev Jsut Just
iabbrev Jstu Just
iabbrev Machien Machine
iabbrev machien machine
" ------ END ------ "



"------- PROGRAMMING MAPPINGS ------- "
inoremap () ()<esc>hli
inoremap "" ""<esc>hli
inoremap '' ''<esc>hli
inoremap `` ``<esc>hli
inoremap {} {}<esc>hli
inoremap [] []<esc>hli
inoremap <> <><esc>hli
inoremap <html <html lang="en"></html> <esc><s-f>/hi
inoremap <body <body></body> <esc><s-f>/hi
inoremap <head <head></head> <esc><s-f>/hi
inoremap <li <li></li> <esc><s-f>/hi
inoremap <ul <ul></ul> <esc><s-f>/hi
inoremap <a <a></a> <esc><s-f>/hi
inoremap <h1 <h1></h1> <esc><s-f>/hi
inoremap <title <title></title> <esc><s-f>/hi
inoremap <h2 <h2></h2> <esc><s-f>/hi
inoremap <div <div></div> <esc><s-f>/hi
inoremap <b <b></b> <esc><s-f>/hi
inoremap <p <p></p> <esc><s-f>/hi
inoremap <!DOC <!DOCTYPE html>
"-------- END ------- "



" -------- NON-VUNDLE PLUGINS --------- "

" Spelling error fixer plugin: Fixes the last misspelled word before the cursor
function! FixLastSpellingError()
    normal! ma[s1z=`a
endfunction

nnoremap <leader>sp :call FixLastSpellingError()<cr>    " calls the function
nnoremap <leader>sop :source %<cr>          " sources the file


" This plugin moves lines to the top of the list
function! MoveEm(position)
    let saved_cursor = getpos(".")
    let prev_blank_line = search('^$', 'bn')
    let target_line = prev_blank_line + a:position - 1
    execute 'move ' . target_line
    call setpos('.', saved_cursor)
endfunction

" Allows you to choose actual positions from 1-9 in the line list via m1, m2,
" etc. For example, if you want to move your line to line 2 from the top of
" this paragraph, use: m2
for position in range(1, 9)
    execute 'nnoremap m' . position . ' :call MoveEm(' . position . ')<cr>'
endfor



" My plugin for turning lines into a bulleted list
function! BulletList()
    let l:line = getline(line("."))
    if l:line =~ '^\s*$'
        return
    else
        normal! I* 
    endif
endfunction

nnoremap <leader>bl :call BulletList()<cr>
vnoremap <leader>bl :call BulletList()<cr>
" --------------- END ----------------- "



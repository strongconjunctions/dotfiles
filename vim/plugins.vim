filetype off                  " required
set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" NB! You only the URI of the github address of the plugin in
" order to pull it. So from 'www.github.com/tpope/vim-vindegar', 
" you only need the 'tpope/vim-vinegar' part in order to put it
" in this file, and install it.
Plugin 'VundleVim/Vundle.vim'   " Vundle plugin itself
Plugin 'tpope/vim-vinegar'      " plugin for Vinegar
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'     " CtrlP plugin (for fuzzy file search)
                                " use <CTRL-p> to autocomplete a file
Plugin 'tmhedberg/SimpylFold'   " code folding (for Python)
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}   " powerline
Plugin 'ap/vim-css-color'       " Adds actual color to CSS colors in editor
Plugin 'davidhalter/jedi-vim'   " Python autocompletion plugin
Plugin 'rking/ag.vim'           " Ag super-fast search plugin
Plugin 'nvie/vim-flake8'        " PEP-8 checking for python files
Plugin 'tpope/vim-surround'     " Surround text with parens, or tags
Plugin 'chriskempson/base16-vim'    " base16 themes
Plugin 'tpope/vim-repeat'       " Extends the . command to non-native plugins
Plugin 'skwp/greplace.vim'      " Plugin for find/replace
Plugin 'vim-airline/vim-airline'    " Status bar plugin
Plugin 'vim-airline/vim-airline-themes'    " Self-explanatory
Plugin 'mileszs/ack.vim'            " Grep files in current dir for grep patterns (words, etc)
Plugin 'tpope/vim-fugitive'         " A very cool Git wrapper
Plugin 'flazz/vim-colorschemes'     " Additional Vim colorschemes
Plugin 'vim-syntastic/syntastic'    " Checks language syntax via an external
                                    " syntax checker (while typing)
Plugin 'SirVer/ultisnips'           " Advanced snippets system
Plugin 'ervandew/supertab'          " Context-aware <tab> completion


" Snipmate and it's dependencies
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'    " Awesome text-expansion plugin

" Python plugins
Plugin 'klen/python-mode'
Plugin 'mitsuhiko/vim-python-combined'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'jmcantrell/vim-virtualenv'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



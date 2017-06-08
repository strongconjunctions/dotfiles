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

Plugin 'ap/vim-css-color'       " Adds actual color to CSS colors in editor
Plugin 'davidhalter/jedi-vim'   " Python autocompletion plugin
Plugin 'rking/ag.vim'           " Ag super-fast search plugin
Plugin 'skwp/greplace.vim'      " Plugin for find/replace
Plugin 'vim-airline/vim-airline'    " Status bar plugin
p>     
Plugin 'tpope/vim-fugitive'         " A very cool Git wrapper
Plugin 'flazz/vim-colorschemes'     " Additional Vim colorschemes
Plugin 'vim-syntastic/syntastic'   " Checks language syntax via an external
                                " syntax checker
Plugin 'klen/python-mode'
Plugin 'mitsuhiko/vim-python-combined'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'jmcantrell/vim-virtualenv'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



filetype off                  " required

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
Plugin 'ctrlpvim/ctrlp.vim'     " CtrlP plugin
Plugin 'ap/vim-css-color'       " Adds actual color to CSS colors in editor
Plugin 'davidhalter/jedi-vim'   " Python autocompletion plugin
Plugin 'rking/ag.vim'           " Ag super-fast search plugin
Plugin 'skwp/greplace.vim'      " Plugin for find/replace

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



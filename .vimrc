set nocompatible              " be iMproved, required
filetype off                  " required

" Begin Vundle Config
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')
    
    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'tpope/vim-sensible'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-ragtag'
    Plugin 'jnurmine/Zenburn'
    Plugin 'tomtom/tcomment_vim'

    
    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    " To ignore plugin indent changes, instead use:
    "filetype plugin on

" Begin Leader Functions
    let mapleader="\<Space>"

" Begin Styling
    set t_Co=256
    colors zenburn

" Begin Custom Config
    set numberwidth=5
    "set expandtab
    
    :set number
    :set relativenumber
    
    inoremap jk <ESC>
    inoremap kj <ESC>

"  Assorted Miscellany
    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line
    
    " To install run :PluginInstall from vim
    " Or from the command line run vim +PluginInstall +qall


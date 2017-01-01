set nocompatible              " be iMproved, required
filetype off                  " required

" Begin Vundle Config
" set the runtime path to include Vundle and initialize

    if has('win') || has('win32unix')
        set rtp+=C:/Users/cmfong/vimfiles/bundle/Vundle.vim/
        call vundle#begin('C:/Users/cmfong/vimfiles/bundle')
    elseif has('mac') || has('macunix')
        set rtp+=~/vim/bundle/Vundle.vim
        call vundle#begin()
    endif

    " let Vundle manage Vundle, required
        Plugin 'VundleVim/Vundle.vim'

    " Add Vundle packages here:
        Plugin 'scrooloose/nerdtree'
        Plugin 'tpope/vim-sensible'
        Plugin 'tpope/vim-surround'
        Plugin 'tpope/vim-ragtag'
        Plugin 'jnurmine/Zenburn'
        Plugin 'tomtom/tcomment_vim'

    " Typescript Plugins and Settings
        Plugin 'shougo/vimproc.vim'
        Plugin 'quramy/tsuquyomi'
        Plugin 'leafgarland/typescript-vim'

        autocmd QuickFixCmdPost [^l]* nested cwindow
        autocmd QuickFixCmdPost l* nested lwindow

    call vundle#end()
    filetype plugin indent on

" Begin Leader Functions
    let mapleader="\<Space>"
    nmap <leader>trailing :%s/\s\+$//e<Enter>

" Begin Custom Config

    filetype plugin indent on
    set tabstop=4
    set shiftwidth=4
    set expandtab

    set number
    set relativenumber
    set numberwidth=5

    inoremap jk <ESC>
    inoremap kj <ESC>

" Begin Styling
    set t_Co=256
    colors zenburn


"  Assrted Miscellany
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


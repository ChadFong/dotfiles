set nocompatible              " be iMproved, required
filetype off                  " required

set visualbell
set t_vb=

" Begin Vundle Config
" set the runtime path to include Vundle and initialize

    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
        Plugin 'VundleVim/Vundle.vim'

    " Add Vundle packages here:
        Plugin 'ctrlpvim/ctrlp.vim'
        Plugin 'tpope/vim-sensible'
        Plugin 'tpope/vim-surround'
        Plugin 'tpope/vim-ragtag'
        Plugin 'jnurmine/Zenburn'
        Plugin 'tomtom/tcomment_vim'

    " Typescript Plugins and Settings
        Plugin 'vim-syntastic/syntastic'
        Plugin 'shougo/vimproc.vim'
        Plugin 'quramy/tsuquyomi'
        Plugin 'leafgarland/typescript-vim'

        autocmd QuickFixCmdPost [^l]* nested cwindow
        autocmd QuickFixCmdPost l* nested lwindow

    call vundle#end()
    filetype plugin indent on

" TS Configuration
    " Syntastic recommended start settings
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    " End said settings

    let g:tsuquyomi_disable_quickfix = 1
    let g:syntastic_typescript_checkers = ['tsuquyomi']

    autocmd FileType typescript nmap <buffer> <leader>t : <C-u>echo tsuquyomi#hint()<CR>

" CtrlP Config
    set wildignore+=*/tmp/*,*.so,*.swp,*.js,*.css,*.dll,*/node_modules/*,*/jspm_packages/*,*/bin/*
    
    " File completion routes from file instead of where nvim was called
    set autochdir

" Begin Leader Functions
    let mapleader="\<Space>"
    nmap <leader>trail :%s/\s\+$//e<Enter>

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

" Fold File Control
    function Fold_file()
        set foldmethod=indent
        set foldcolumn=4
        set foldenable
    endfunction

    function Unfold_file()
        set foldcolumn=0
        set nofoldenable
    endfunction

    nnoremap <LEADER>_ :call Fold_file()<CR>
    nnoremap <LEADER>- :call Unfold_file()<CR>

let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

    
if exists('$TMUX')
    function! TmuxOrSplitSwitch(wincmd, tmuxdir)
        let previous_winnr = winnr()
        silent! execute "wincmd " . a:wincmd
        if previous_winnr == winnr()
            call system("tmux select-pane -" . a:tmuxdir)
            redraw!
        endif
    endfunction

    nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
    nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
    nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
    nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l
endif

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


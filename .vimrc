set nocompatible              " be iMproved, required
filetype off                  " required

" Begin Vundle Config
" set the runtime path to include Vundle and initialize

    if has('win') || has('win32unix')
        set rtp+=C:/Users/cmfong/vimfiles/bundle/Vundle.vim/
        call vundle#begin('C:/Users/cmfong/vimfiles/bundle')
    elseif has('mac') || has('macunix')
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
    endif

    " let Vundle manage Vundle, required
        Plugin 'VundleVim/Vundle.vim'

    " Add Vundle packages here:
        "Plugin 'scrooloose/nerdtree'
        Plugin 'tpope/vim-sensible'
        Plugin 'tpope/vim-surround'
        Plugin 'tpope/vim-ragtag'
        Plugin 'jnurmine/Zenburn'
        Plugin 'tomtom/tcomment_vim'
        "Plugin 'christoomey/vim-tmux-navigator'

    " Typescript Plugins and Settings
        Plugin 'shougo/vimproc.vim'
        Plugin 'quramy/tsuquyomi'
        Plugin 'leafgarland/typescript-vim'

        autocmd QuickFixCmdPost [^l]* nested cwindow
        autocmd QuickFixCmdPost l* nested lwindow

    call vundle#end()
    filetype plugin indent on

" netrw settings
"    let g:netrw_banner = 0
"    let g:netrw_liststyle = 3
"    let g:netrw_browse_split = 4
"    let g:netrw_altv = 1
"    let g:netrw_winsize = 25
"    augroup ProjectDrawer
"        autocmd!
"        autocmd VimEnter * :Vexplore
"    augroup END

" Begin Leader Functions
    let mapleader="\<Space>"
    nmap <leader>trail :%s/\s\+$//e<Enter>

" Begin Custom Config

    " netrw config
        let g:netrw_banner = 0
        let g:netrw_liststyle = 3
        let g:netrw_browse_split = 4
        let g:netrw_altv = 1
        let g:netrw_winsize = 25
        augroup ProjectDrawer
          autocmd!
            autocmd VimEnter * :Vexplore
        augroup END

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

" Tmux Vim navigation: Manual Implementation
    if exists('$TMUX')
        function! TmuxOrSplitSwitch(wincmd, tmuxdir)
            let previous_winnr = winnr()
            silent! execute "wincmd " . a:wincmd
            if previous_winnr == winnr()
                call system("tmux select-pane -" . a:tmuxdir)
                redraw!
            endif
        endfunction

        let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
        let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
        let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te
        
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


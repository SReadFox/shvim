" Environment {
    set nocompatible 	" be iMproved
    filetype off 		" required!

    " Setup Bundle Support
    " The next two lines ensure that the ~/.vim/bundle/ system works
    set rtp+=~/.vim/bundle/vundle
    call vundle#rc()
" }



" Bundles {
    " let Vundle manage Vundle
    " required!
    Bundle 'gmarik/vundle'

    " plugins
    "Bundle 'vim-scripts/bufexplorer.zip'
    "Bundle 'fholgado/minibufexpl.vim'
    Bundle 'vim-scripts/minibufexpl.vim'
    "Bundle 'vim-scripts/taglist.vim'
    Bundle 'majutsushi/tagbar'
    Bundle 'vim-scripts/DoxygenToolkit.vim'
    Bundle 'scrooloose/syntastic'
    Bundle 'scrooloose/nerdtree'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'Rip-Rip/clang_complete'
    Bundle 'ervandew/supertab'
" }



" General Configurations {
    filetype plugin indent on 	" required!

    " color
    colorscheme desert

    " color the 80th column, vim version >= 7.3
    "set colorcolumn=80

    " show
    set showmode
    set showcmd
    set showmatch

    " search
    set incsearch
    set hlsearch

    " TAB and space
    set tabstop=4
    set shiftwidth=4
    set expandtab

    " line number
    set number

    " split
    map <S-s> :split<cr>
    map <S-v> :vsplit<cr>

    " windows size
    " height
    map <S-j> <C-W>+
    map <S-k> <C-W>-
    " width
    map <S-h> <C-W><
    map <S-l> <C-W>>

    " move among several windows
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l

    " encoding
    set encoding=utf-8
    set fileencodings=utf-8,gbk,gb2312,gb18030,ucs-bom,cp936,latin1
    " encode current file
    map en :set fileencoding=utf-8<cr>

    " quickfix
    nmap <silent> <F6> :cn<cr>
    nmap <silent> <F7> :cp<cr>
    nmap <silent> <F10> :cw<cr>
" }



" Plugin Configurations {
"
    " bufexplorer {
    " \be to list buffers
    " j, k to move, d to close, r to reverse order of buffer list
    " }

    " minibufexpl {
        let g:miniBufExplMapWindowNavVim=1 
        let g:miniBufExplMapWindowNavArrows=1 
        let g:miniBufExplMapCTabSwitchBufs=1 
        let g:miniBufExplModSelTarget=1 
        " open next buffer
        map <S-n> :bn!<cr>
        " open previous buffer
        map <S-p> :bp!<cr> 
    " }

    " taglist {
    "    let Tlist_Show_One_File=1
    "    let Tlist_Exit_OnlyWindow=1
    "    let Tlist_Use_Right_Window = 1
    "    let Tlist_Sort_Type = "name"
    "    map <F12> :Tlist<cr>
    " }

    " TagBar {
         nnoremap <silent> <leader>tt :TagbarToggle<CR>
    " }
 
    " DoxygenToolkit {
        map do :Dox<cr>
    " }

    " syntastic {
    "
    " }
 
    " nerdtree {
        map nt :NERDTreeToggle<cr>
        " open nerdtree and taglist by one key
        map wm :NERDTreeToggle<cr> :TagbarToggle<cr>
    " }

    " nerdcommenter {
        map cm <plug>NERDCommenterToggle
    " }

    " clang_complete {
        " use libclang.so, not the executeable file clang
        let g:clang_use_library = 1
        " nothing is selected
        let g:clang_auto_select = 0
        " automatically complete after ->, ., ::
        let g:clang_complete_auto = 1
        " highlight warnings and errors
        let g:clang_hl_errors = 1
        " open quickfix window on error
        "let g:clang_complete_copen = 1
        " periodically update the quickfix window
        "let g:clang_periodic_quickfix = 1
        " close the preview window automatically after acompletion
        "let g:clang_close_preview = 1
        " do not open the preview window
        set completeopt=menu,longest
    " }

    " supertab {
        let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
    " }

" }


" External Tools {

    " Astyle {
        source $HOME/.shvim/config/astyle 
    " }

    " ctags and cscope {
        source $HOME/.shvim/config/tagscope 
    " }

" }



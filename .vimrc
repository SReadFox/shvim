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
    Bundle 'vim-scripts/bufexplorer.zip'
    Bundle 'vim-scripts/DoxygenToolkit.vim'
    Bundle 'scrooloose/syntastic'
    Bundle 'scrooloose/nerdtree'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'Shougo/neocomplcache'
" }



" General Configurations {
    filetype plugin indent on 	" required!

    " color
    colorscheme desert

    " TAB and space
    set tabstop=4
    set shiftwidth=4
    set expandtab

    " line number
    set number
" }



" Plugin Configurations {
"
    " bufexplorer {
    "
    " }
 
    " DoxygenToolkit {
        map do :Dox<cr>
    " }
 
    " nerdtree {
    "
    " }

    " nerdcommenter {
        map cm <plug>NERDCommenterToggle
    " }

    " neocomplcache {
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_underbar_completion = 1
    " }

" }



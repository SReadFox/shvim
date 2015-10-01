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
    "Bundle 'vim-scripts/DrawIt'
    "Bundle 'vim-scripts/DoxygenToolkit.vim'
    Bundle 'fholgado/minibufexpl.vim'
    Bundle 'majutsushi/tagbar'
    Bundle 'scrooloose/nerdtree'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'vim-scripts/AutoClose'
    Bundle 'tpope/vim-surround'
    Bundle 'tpope/vim-fugitive'
    Bundle 'SirVer/ultisnips'
    Bundle 'honza/vim-snippets'
    Bundle 'vim-scripts/a.vim'
    Bundle 'klen/python-mode'
    Bundle 'fatih/vim-go'
    Bundle 'garyburd/go-explorer'
    Bundle 'Valloric/YouCompleteMe'
" }



" General Configurations {
    filetype plugin indent on 	" required!

    " color scheme
    colorscheme desert

    " terminal color
    set t_Co=256
    "set t_Co=8

    " syntax highlighting
    syntax on

    " fold method - folds defined by syntax highlighting
    set foldmethod=syntax
    " all folds are open
    set foldlevel=100

    " character encoding used in the script
    scriptencoding utf-8

    " allow buffer switching without saving
    set hidden

    " highlight current line
    set cursorline

    " indent at the same level of the previous line
    set autoindent

    " color the 81st column, vim version >= 7.3
    if version >= 703
        set colorcolumn=81
    endif

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
        

    " Always show status line, even for one window
    set laststatus=2
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=%{fugitive#statusline()} "  Git Hotness
    " fileencoding and filetype
    set statusline+=\ [%{GetFileEncoding()}/%{&ff}/%Y]
    set statusline+=\ [%b/0x%B]            " ASCII value of char under cursor
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    
    " line number and column number
    set number
    set ruler

    " make backspace work normal
    "set backspace=2
    set backspace=indent,eol,start

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
    nmap <silent> <F8> :cw<cr>
" }



" Plugin Configurations {
"
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

    " TagBar {
        map tt :TagbarToggle<CR>
    " }
 
    " DoxygenToolkit {
        let g:DoxygenToolkit_commentType="C++"
        map fg :Dox<cr>
    " }

    " nerdtree {
        map nt :NERDTreeToggle<cr>
        " open nerdtree and taglist by one key
        map wm :NERDTreeToggle<cr> :TagbarToggle<cr>
    " }

    " nerdcommenter {
        map cm <plug>NERDCommenterToggle
    " }

    " python-mode {
        let g:pymode_lint_checker = "pyflakes"
    " }

    " Fugitive {
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
    " }
    
    " A.vim {
        let g:alternateExtensions_h = "c,cpp,cxx,cc,CC"
        let g:alternateExtensions_H = "C,CPP,CXX,CC"
        let g:alternateExtensions_cpp = "h,hpp"
        let g:alternateExtensions_CPP = "H,HPP"
        let g:alternateExtensions_c = "h"
        let g:alternateExtensions_C = "H"
        let g:alternateExtensions_cxx = "h"

        " key map
        map <C-A> :A<CR>

        " search path
        "   dwr: relative to working directory
        "   sfr: relative to current file
        "   abs: absolute path
        "   reg: regex path
        let g:alternateSearchPath = 'dwr:include,dwr:src,'
                \.'sfr:../include,sfr:../src,'
                \.'reg:/include/src/g/,reg:/src/include/g/'

        " Do not create the missing alternate file
        let g:alternateNoDefaultAlternate = 1
    " }

    " vim-go {
        " enable syntax-highlighting for functions, methods and struts
        let g:go_highlight_functions = 1
        let g:go_highlight_methods = 1
        let g:go_highlight_structs = 1
        let g:go_highlight_operators = 1
        let g:go_highlight_build_constraints = 1
        " Enable goimports to automatically insert import paths instead of
        " gofmt
        let g:go_fmt_command = "goimports"
        " do not show errors for the fmt command
        " let g:go_fmt_fail_silently = 1
        " disable auto fmt on save
        " let g:go_fmt_autosave = 0
        " Disable opening browser after posting your snippet to
        " play.golang.org
        let g:go_play_open_browser = 0
        " By default when :GoInstallBinaries is called, the binaries are
        " installed to $GOBIN or $GOPATH/bin. To change it 
        " let g:go_bin_path = expand("~/app/gotools")
        " key mappings
        au FileType go nmap <leader>r <Plug>(go-run)
        au FileType go nmap <leader>b <Plug>(go-build)
        au FileType go nmap <leader>t <Plug>(go-test)
        au FileType go nmap <leader>c <Plug>(go-coverage)
        au FileType go nmap <Leader>ds <Plug>(go-def-split)
        au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
        au FileType go nmap <Leader>dt <Plug>(go-def-tab)
        au FileType go nmap <Leader>gd <Plug>(go-doc)
        au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
        au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
        au FileType go nmap <Leader>s <Plug>(go-implements)
        au FileType go nmap <Leader>i <Plug>(go-info)
        au FileType go nmap <Leader>e <Plug>(go-rename)
    " }

    " YCM {
        set completeopt-=preview
    " }


" External Tools {

    " ctags and cscope {
        source $HOME/.vim/local_config/tags/tagscoperc 
    " }

" }

" Functions {

" Get file encoding
function! GetFileEncoding()
	return (&fenc == '' ? &enc : &fenc)
endfunction

" }



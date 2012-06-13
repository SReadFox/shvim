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
    Bundle 'fholgado/minibufexpl.vim'
    "Bundle 'vim-scripts/minibufexpl.vim'
    Bundle 'corntrace/bufexplorer'
    "Bundle 'vim-scripts/taglist.vim'
    Bundle 'majutsushi/tagbar'
    Bundle 'vim-scripts/DoxygenToolkit.vim'
    Bundle 'scrooloose/syntastic'
    Bundle 'scrooloose/nerdtree'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'Rip-Rip/clang_complete'
    "Bundle 'exclipy/clang_complete'
    Bundle 'ervandew/supertab'
    Bundle 'tpope/vim-surround'
    Bundle 'vim-scripts/AutoClose'
    Bundle 'tpope/vim-fugitive'
    "Bundle 'Lokaltog/vim-powerline'
    Bundle 'vim-scripts/c.vim'
    Bundle 'vim-scripts/a.vim'
    Bundle 'klen/python-mode'
    Bundle 'vim-scripts/python.vim'
    Bundle 'vim-scripts/python_match.vim'
    Bundle 'vim-scripts/pythoncomplete'
" }



" General Configurations {
    filetype plugin indent on 	" required!

    " color scheme
    colorscheme desert

    " terminal color
    set t_Co=256

    " syntax highlighting
    syntax on

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
        map tt :TagbarToggle<CR>
    " }
 
    " DoxygenToolkit {
        map fg :Dox<cr>
    " }

    " syntastic {
        " Jump to the first error detected
        let g:syntastic_auto_jump=1
        " error window will be automatically opened when errors are
        " detected, and closed when none are detected
        let g:syntastic_auto_loc_list=1 
        " the height of the location lists that syntastic opens
        let g:syntastic_loc_list_height=5
        " do syntax checks when buffers are first loaded as
        " well as on saving
        "let g:syntastic_check_on_open=1 

        " check header files too
        let g:syntastic_c_check_header = 1
        let g:syntastic_cpp_check_header = 1
        " re-check header files on every file write
        let g:syntastic_c_auto_refresh_includes = 1
        let g:syntastic_cpp_auto_refresh_includes = 1
        " remove errors of files included via the g:syntastic_c_include_dirs
        " setting from the result set
        let g:syntastic_c_remove_include_errors = 1
        let g:syntastic_cpp_remove_include_errors = 1
        " additional compiler arguments like include directories or CFLAGS
        let g:syntastic_c_config_file = '.syntastic_c_config'
        let g:syntastic_cpp_config_file = '.syntastic_cpp_config'
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
        " completion options
        set completeopt=menu,longest,preview

        " use libclang.so, not the executeable file clang
        let g:clang_use_library = 1
        "let g:clang_library_path=""
        "
        " select the first entry but not insert into the code
        let g:clang_auto_select = 1

        " automatically complete after ->, ., ::
        let g:clang_complete_auto = 1

        " highlight warnings and errors
        let g:clang_hl_errors = 1

        " open quickfix window on error
        let g:clang_complete_copen = 1
        " periodically update the quickfix window
        "let g:clang_periodic_quickfix = 1
        nnoremap <Leader>q :call g:ClangUpdateQuickFix()<CR>

        " close the preview window automatically after acompletion
        let g:clang_close_preview = 1

        " do some snippets magic after a ( or a , inside function   
        " call. Not currently fully working)
        "let g:clang_snippets = 1
        "
        " complete preprocessor macros and constants
        let g:clang_complete_macros = 1

        " How results are sorted
        let g:clang_sort_algo="priority"

        " indexer
        "let g:clic_filename=".index/index.db"
        "nnoremap <Leader>r :call ClangGetReferences()<CR>
        "nnoremap <Leader>d :call ClangGetDeclarations()<CR>
        "nnoremap <Leader>s :call ClangGetSubclasses()<CR>
        "map <F11> :call ClangIndexer()<CR>

    " }

    " supertab {
        "let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
        " use omni completion
        let g:SuperTabDefaultCompletionType = '<C-X><C-O>'
    " }

    " python-mode {
        let g:pymode_lint_checker = "pyflakes"
    " }

    " csupport {
        let g:C_FormatTime='%a %b %e %H:%M:%S %Y'
        let g:C_LocalTemplateFile=$HOME.'/.vim/local_config/csupport/Templates'

        " stop using C-J to enterinsert mode 
        let g:C_Ctrl_j   = 'off'
    " }

    " powerline {
        "let g:Powerline_symbols = 'fancy'
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
        let g:alternateExtensions_H' = "C,CPP,CXX,CC"
        let g:alternateExtensions_cpp' = "h,hpp"
        let g:alternateExtensions_CPP' = "H,HPP"
        let g:alternateExtensions_c' = "h"
        let g:alternateExtensions_C' = "H"
        let g:alternateExtensions_cxx' = "h"

        " key map
        map <C-A> :A<CR>

        " search path
        "let g:alternateSearchPath = 'dwr:include,sfr:../include'

        " Do not create the missing alternate file
        let g:alternateNoDefaultAlternate = 1
    " }


" }


" External Tools {

    " Astyle {
        source $HOME/.vim/local_config/astyle/astylerc 
    " }

    " ctags and cscope {
        "source $HOME/.vim/local_config/tagscoperc 
    " }

" }

" Functions {

" Get file encoding
function! GetFileEncoding()
	return (&fenc == '' ? &enc : &fenc)
endfunction

" Clang indexer
function! ClangIndexer()
    " get current cursor position
    let lineNum = line(".")

    exec ("%!clic_update.sh ".getcwd())

    " return to the previous cursor position
    exec lineNum
endfunction


" File Comment
map <F4> :call FileComment()<cr>
function AddFileComment()
    call append(0, "/*")
    call append(1, " * @file ".expand("%:t"))
    call append(2, " * @brief ")
    call append(3, " * ")
    call append(4, " * @version 1.0")
    call append(5, " * @date ".strftime("%a %b %e %H:%M:%S %Y"))
    call append(6, " * ")
    call append(7, " * @copyright Copyright (C) ".strftime("%Y")." UESTC")
    call append(8, " * @author shiwei<shiwei2012@gmail.com>")
    call append(9, " */")
    echohl WarningMsg | echo "Successful in adding the copyright." 
            \ | echohl None
endfunc

function UpdateFileComment()
    normal m'
    execute '/@file/s@e.*$@\="e ".expand("%:t")@'
    execute "noh"
    normal ''
    echohl WarningMsg | echo "Successful in updating the copyright." 
            \ | echohl None
endfunc'

function FileComment()
    let n = 1 
    while n < 10
        let line = getline(n)
        if line =~ '^ \*\s*\S* @file \S*.*$'
            call UpdateFileComment()
            return
        endif
        let n = n + 1
    endwhile
    call AddFileComment()
endfunction"

" }



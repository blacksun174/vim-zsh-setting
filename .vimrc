set encoding=utf-8

set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

syntax enable

if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')
 
 call dein#add('Shougo/unite.vim')
 call dein#add('~/.cache/dein')
 call dein#add('scrooloose/nerdtree')
 call dein#add('tpope/vim-fugitive')
 call dein#add('Shougo/deoplete.nvim')
 call dein#add('tomtom/tcomment_vim')
 call dein#add('nathanaelkane/vim-indent-guides')
 call dein#add('davidhalter/jedi-vim')
 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#end()
 call dein#save_state()
endif

""""""""""""""""""""""""""""""
" Unit.vim$B$N@_Dj(B
""""""""""""""""""""""""""""""
" $BF~NO%b!<%I$G3+;O$9$k(B
let g:unite_enable_start_insert=1
" $B%P%C%U%!0lMw(B
" noremap <C-P> :Unite buffer<CR>
" $B%U%!%$%k0lMw(B
noremap <C-N> :Unite -buffer-name=file file<CR>
" $B:G6a;H$C$?%U%!%$%k$N0lMw(B
noremap <C-Z> :Unite file_mru<CR>
" sources$B$r!V:#3+$$$F$$$k%U%!%$%k$N%G%#%l%/%H%j!W$H$9$k(B
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" $B%&%#%s%I%&$rJ,3d$7$F3+$/(B
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" $B%&%#%s%I%&$r=D$KJ,3d$7$F3+$/(B
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESC$B%-!<$r(B2$B2s2!$9$H=*N;$9$k(B
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""
" NERDTree setting
""""""""""""""""""""""""""""""
"ctr + e $B$G5/F0(B
nnoremap <silent><C-e> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Vim Indent Guides
""""""""""""""""""""""""""""""
"define custom colors instead of using the ones the plugin automatically generates for me
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
" colorscheme file
hi IndentGuidesOdd  guibg=red   ctermbg=3
" key bind
noremap <C-I> :IndentGuidesEnable<CR>
noremap <C-O> :IndentGuidesDisable<CR>
noremap <C-U> :IndentGuidesToggle<CR>
hi IndentGuidesEven guibg=green ctermbg=4
" vim$B$rN)$A>e$2$?$H$-$K!"<+F0E*$K(Bvim-indent-guides$B$r%*%s$K$9$k(B
let g:indent_guides_enable_on_vim_startup = 1
" $B%?%VJ8;z$NI=<(I}(B
set tabstop=2
" Vim$B$,A^F~$9$k%$%s%G%s%H$NI}(B
set shiftwidth=2
filetype plugin indent on


""""""""""""""""""""""""""""
" Not Plugin setting
""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" $BA43Q%9%Z!<%9$NI=<((B
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '$B!!(B')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" $B<+F0E*$KJD$83g8L$rF~NO(B
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""

"$B%8%c%s%W$9$k(B
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

let mapleader = "\<Space>"

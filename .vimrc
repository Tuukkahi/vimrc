call plug#begin('~/.vim/plugged')
Plug 'jacoborus/tender.vim'
Plug 'crusoexia/vim-monokai'

Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'

call plug#end()
filetype plugin indent on
syntax enable

colorscheme tender

set number
set showmatch

if has("autocmd")
	au BufReadPost * if line("'\'") > 1 && line("'\'") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
	filetype plugin indent on
endif


let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

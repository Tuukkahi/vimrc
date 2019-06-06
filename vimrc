call plug#begin('~/.vim/plugged')
Plug 'jacoborus/tender.vim'
Plug 'crusoexia/vim-monokai'

Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'

Plug 'sirver/ultisnips'

Plug 'honza/vim-snippets'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
call plug#end()

filetype plugin indent on
syntax enable

colorscheme tender

set number
set showmatch
set cursorline
set hls

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

if has("autocmd")
	filetype plugin indent on
endif


"for LaTeX
autocmd FileType tex nmap <buffer> <C-T> :!xelatex %<CR>
autocmd FileType tex nmap <buffer> T :!zathura %:r.pdf<CR><CR>
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal="abdgm" 
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

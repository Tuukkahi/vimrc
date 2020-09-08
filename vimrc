call plug#begin('~/.vim/plugged')
Plug 'jacoborus/tender.vim'

Plug 'lervag/vimtex'
Plug   'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} 

"Plug 'sirver/ultisnips'

Plug 'honza/vim-snippets'

"Highlighters
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'derekwyatt/vim-scala'
Plug 'bfrg/vim-cpp-modern'

Plug 'https://github.com/w0rp/ale.git'


Plug 'luochen1990/rainbow'
call plug#end()

set viminfo+=n~/.vim/viminfo

let g:rainbow_active = 1

filetype plugin indent on
syntax enable

colorscheme tender

set number
set showmatch
set cursorline
set hls
set ruler
set backspace=2
set shiftwidth=4
set tabstop=2
set softtabstop=2

imap jk <esc>

au BufRead,BufNewFile *.sbt set filetype=scala

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

if has("autocmd")
	filetype plugin indent on
endif


"for LaTeX
autocmd FileType tex nmap <buffer> <C-T> :!pdflatex %<CR>
autocmd FileType tex nmap <buffer> T :!zathura %:r.pdf<CR><CR>
"let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_latexmk_enabled = 1
"set conceallevel=2
"let g:tex_conceal="abggm" 
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" put \begin{} \end{} tags tags around the current word
map  <C-B>      YpkI\begin{<ESC>A}<ESC>jI\end{<ESC>A}<esc>kA
map! <C-B> <ESC>YpkI\begin{<ESC>A}<ESC>jI\end{<ESC>A}<esc>kA


"ale
nnoremap <Leader>l :ALEToggle<CR>
nnoremap <Leader>L :ALEFix<space>

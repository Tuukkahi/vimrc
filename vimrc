if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'jacoborus/tender.vim'

Plug 'lervag/vimtex'

"Highlighters
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'derekwyatt/vim-scala'
Plug 'bfrg/vim-cpp-modern'

Plug 'https://github.com/w0rp/ale.git'
Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'

Plug 'luochen1990/rainbow'
call plug#end()

set viminfo+=n~/.vim/viminfo

let g:rainbow_active = 1

filetype plugin indent on
syntax enable

colorscheme tender

set autoread
set number
set showmatch
set cursorline
set ruler
set backspace=2

set autoindent expandtab
set shiftwidth=4
set tabstop=2
set softtabstop=2

set hlsearch ignorecase incsearch smartcase   "search

set nobackup noswapfile nowritebackup     "disable .swp files

"undo
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif
set undodir=~/.vim/undo
set undofile

imap jk <esc>

nnoremap <leader>b :ls<CR>:buffer<space>|   "show buffer
nnoremap <silent> <leader>i gg=G``<CR>|     "fix indentation
nnoremap <leader>r :retab<CR>|      "tabs to spaces

cnoreabbrev w!! w !sudo tee > /dev/null %|      "forgot sudo...

au BufRead,BufNewFile *.sbt set filetype=scala
let g:scala_scaladoc_indent = 1

" open file where I left it
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif

if has("autocmd")
    filetype plugin indent on
endif

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"for LaTeX
autocmd FileType tex nmap <buffer> <C-T> :!pdflatex %<CR>
autocmd FileType tex nmap <buffer> T :!zathura %:r.pdf<CR><CR>
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_flavor = "latex"

" put \begin{} \end{} tags tags around the current word
map  <C-B>      YpkI\begin{<ESC>A}<ESC>jI\end{<ESC>A}<esc>kA
map! <C-B> <ESC>YpkI\begin{<ESC>A}<ESC>jI\end{<ESC>A}<esc>kA

"snippets
set runtimepath+=~/.vim/snippets/
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let mapleader=","
"ale
nnoremap <Leader>l :ALEToggle<CR>
nnoremap <Leader>L :ALEFix<space>

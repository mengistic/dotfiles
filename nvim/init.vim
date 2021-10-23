"  $HOME/.config/nvim/init.vim
"  __  __                    _   _       _           
" |  \/  | ___ _ __   __ _  | \ | |_   _(_)_ __ ___  
" | |\/| |/ _ \ '_ \ / _` | |  \| \ \ / / | '_ ` _ \ 
" | |  | |  __/ | | | (_| | | |\  |\ V /| | | | | | |
" |_|  |_|\___|_| |_|\__, | |_| \_| \_/ |_|_| |_| |_|
"                    |___/                           

" ==> Plugins
call plug#begin('~/.config/nvim/plugged')
  Plug 'morhetz/gruvbox'
  Plug 'ycm-core/YouCompleteMe'
  Plug 'LukeSmithxyz/vimling'
  Plug 'lervag/vimtex'
  Plug 'kyazdani42/nvim-web-devicons'

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
call plug#end()

colorscheme gruvbox
imap <C-H> <Esc>:call ToggleIPA()<CR>:call ToggleDeadKeys()<CR>a
" <==

" ==> General
syntax on
let mapleader=" "

filetype plugin indent on

setlocal colorcolumn=80
set nocompatible
set number relativenumber incsearch showcmd nohlsearch
set smartindent smartcase smarttab 
set expandtab autoindent cindent 
set tabstop=2 shiftwidth=2 softtabstop=2 
set hidden nowrap noshowmode noswapfile nobackup
set undodir=~/.config/nvim/undodir
set undofile ignorecase
set scrolloff=3
set encoding=utf-8
set path+=**
set re=1
set mouse=a

" Folding
set fillchars=fold:\-
set foldmethod=marker 
nnoremap <tab> za
set foldmarker===>,<==


" set hlsearch
" highlight Search       term=reverse
highlight Search       ctermfg=white     ctermbg=yellow
highlight ColorColumn  ctermbg=darkgray
highlight Cursor       ctermfg=darkgray ctermbg=black
highlight iCursor      guifg=darkgray   guibg=steelblue
highlight LineNR       cterm=none       ctermfg=darkgray ctermbg=none
highlight CursorLineNR cterm=bold       ctermbg=darkgray ctermfg=white
highlight Normal       guibg=none ctermbg=none
hi Visual cterm=bold ctermbg=darkgrey ctermfg=white
"highlight Visual       ctermfg=lightgray   cterm=italic     ctermbg=gray
"highlight Visual       cterm=italic     ctermbg=silver
"hi Visual cterm=none ctermbg=darkgrey ctermfg=cyan
" <==

" ==> Remap
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
noremap Q :q<CR>

inoremap `` <Esc>/(++)<Enter>"_c4l
"inoremap <S-Tab> <Esc>/•<Enter>"_cl
vnoremap <C-y> :w !xclip -i -sel c<CR><CR>
noremap <leader>i gg=G''


inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
inoremap <C-j> <Esc>:m .+1<CR>==
inoremap <C-k> <Esc>:m .-2<CR>==
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
" <==

" ==> normal files
autocmd FileType * inoremap {} {}<Esc>i
autocmd FileType * inoremap [] []<Esc>i
autocmd FileType * inoremap () ()<Esc>i
autocmd FileType * inoremap '' ''<Esc>i
autocmd FileType * inoremap "" ""<Esc>i
" <==
" ==> asymptote
au BufRead,BufNewFile *.asy set filetype=asy
autocmd FileType asy map <F1> :w<CR>:!clear<CR> :!asy % <CR>
autocmd FileType asy map <F2> :w<CR>:!clear<CR> :!asy % <CR>
autocmd FileType asy map <F4> :!zathura %:r.pdf & <CR><CR>
autocmd FileType asy inoremap {<Enter> {<Enter>}<Esc>ko<Tab>
" <==
" ==> tex
au BufRead,BufNewFile *.tex set filetype=tex
"autocmd FileType tex map <F1> :w<CR> :!pdflatex -syntex=1 % <CR>
autocmd FileType tex map <F1> :w<CR> :!xelatex % <CR>
autocmd FileType tex map <F4> :!zathura %:r.pdf & <CR><CR>
autocmd FileType tex inoremap <F1> <Esc>:w<CR> :!xelatex % <CR>
autocmd FileType tex inoremap 'b  \textbf{}<Esc>i
autocmd FileType tex inoremap 'i \textit{}<Esc>i
autocmd FileType tex inoremap 'e \emph{}<Esc>i
autocmd FileType tex inoremap 'u \usepackage{}<Esc>i
autocmd FileType tex inoremap "" ``''<Esc>hi
autocmd FileType tex inoremap {<Enter> {<Enter><BS>}<Esc>ko
autocmd FileType tex inoremap <C-E> <Esc>bd$i\begin{<Esc>pa}<Enter><BS>\end{<Esc>pa}<Esc>ko
autocmd FileType tex inoremap \ii \item 
autocmd FileType tex inoremap \item \item 

autocmd FileType tex imap <c-space> <Esc>/•<Enter>"_cl

autocmd FileType tex inoremap \frac \frac{}{•}<Esc>ba
autocmd FileType tex inoremap \\( \left(\right)•<Esc>2bhi
autocmd FileType tex inoremap \\[ \left[\right]•<Esc>2bhi
autocmd FileType tex inoremap \\{ \left{\right}•<Esc>2bhi
autocmd FileType tex inoremap \[ \[\]<Esc>hi
autocmd FileType tex inoremap $$ $$<Esc>i



augroup tex
	autocmd!
	autocmd FileType tex setlocal foldmethod=marker
	" start out with everything folded away
	autocmd FileType tex setlocal foldlevel=0
	autocmd FileType tex setlocal foldlevelstart=0
augroup END
" <==


"" FIXME
" ==> synctex 
" https://gist.github.com/vext01/16df5bd48019d451e078
" https://github.com/lervag/vimtex/issues/414
" https://wraihan.com/posts/vimtex-and-zathura/

"let g:vimtex_latexmk_options="-pdf -pdflatex='xelatex -file-line-error -synctex=1 -interaction=nonstopmode -shell-escape %S %O -verbose'"
"let g:vimtex_compiler_progname= '/usr/bin/nvr'
"let g:vimtex_view_method = 'zathura'
" <==

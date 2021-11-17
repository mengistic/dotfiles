"
"  ██   ██  ██████  ██  ██   ████      ██  ██  ██████  ██   ██
"  ███ ███  ██      ███ ██  ██         ██  ██    ██    ███ ███
"  ██ █ ██  ████    ██ ███  ██ ███     ██  ██    ██    ██ █ ██
"  ██   ██  ██      ██  ██  ██  ██      ████     ██    ██   ██
"  ██   ██  ██████  ██  ██   ████        ██    ██████  ██   ██
"


" ==> Plugins
call plug#begin('~/.config/nvim/plugged')
  Plug 'morhetz/gruvbox'
  Plug 'LukeSmithxyz/vimling'
  Plug 'lervag/vimtex'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdcommenter'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'nvim-lua/plenary.nvim'
  Plug 'TimUntersberger/neogit'

  Plug 'itchyny/lightline.vim'
  Plug 'kevinhwang91/rnvimr'

  Plug 'godlygeek/tabular'
  Plug 'gabrielelana/vim-markdown'
  Plug 'jceb/vim-orgmode'
  Plug 'glepnir/dashboard-nvim'
call plug#end()

colorscheme gruvbox
imap <C-H> <Esc>:call ToggleIPA()<CR>:call ToggleDeadKeys()<CR>a
" <==
" ==> General
syntax on
let mapleader=" "
lua require 'init'

filetype plugin indent on

set nocompatible
set number relativenumber incsearch showcmd nohlsearch
set smartindent smartcase smarttab 
set expandtab autoindent cindent 
set tabstop=2 shiftwidth=2 softtabstop=2 cmdheight=1
set hidden nowrap noshowmode noswapfile nobackup
set undodir=~/.config/nvim/undodir
set undofile ignorecase
set scrolloff=3
set encoding=utf-8
set path+=**
set re=1 mouse=a
set updatetime=300 shortmess+=c
set cursorline 
set showtabline=2
"setlocal colorcolumn=80


" Folding
set fillchars=fold:\ 
set foldmethod=marker 
nnoremap <tab> za
set foldmarker===>,<==



" Highlighting
highlight Folded ctermbg=black
highlight CursorLine ctermbg=0
highlight Search       ctermfg=white     ctermbg=yellow
highlight LineNR       cterm=none       ctermfg=darkgray ctermbg=none
highlight Normal       guibg=none ctermbg=none
highlight Visual cterm=NONE ctermbg=gray ctermfg=black
"highlight StatusLine ctermbg=red ctermfg=black
"highlight CursorLine ctermbg=235
"highlight ColorColumn  ctermbg=darkgray
"highlight CursorLineNR cterm=bold       ctermbg=darkgray ctermfg=blue
"highlight Search       term=reverse
"highlight Cursor       ctermfg=darkgray ctermbg=black
"highlight iCursor      guifg=darkgray   guibg=steelblue
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

" tab
nmap <leader><tab> :tabnext<CR>
nmap <leader>th :tab help 


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
" ==> plugin settings
" ==> lightline
"darcula, ayu_dark, materia
let g:lightline = {
      \ 'colorscheme': 'ayu_dark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ 'component': {
      \   'helloworld': 'Hello, world!'
      \ },
      \ }
let g:lightline.tabline = {
	    \ 'left': [ [ 'tabs' ] ],
	    \ 'right': [ [ 'close' ] ] }

let g:lightline.component = {
	    \ 'mode': '%{lightline#mode()}',
	    \ 'absolutepath': '%F',
	    \ 'relativepath': '%f',
	    \ 'filename': '%t',
	    \ 'modified': '%M',
	    \ 'bufnum': '%n',
	    \ 'paste': '%{&paste?"PASTE":""}',
	    \ 'readonly': '%R',
	    \ 'charvalue': '%b',
	    \ 'charvaluehex': '%B',
	    \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
	    \ 'fileformat': '%{&ff}',
	    \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
	    \ 'percent': '%3p%%',
	    \ 'percentwin': '%P',
	    \ 'spell': '%{&spell?&spelllang:""}',
	    \ 'lineinfo': '%3l:%-2c',
	    \ 'line': '%l',
	    \ 'column': '%c',
	    \ 'close': '%999X • ',
	    \ 'winnr': '%{winnr()}' }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction
" <==
" ==> coc
" ==> show signcolumn
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" <==
" ==> remap <TAB>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" <==
" ==> GoTo code navigation.
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
" <==
" <==
" ==> nerdcommenter
nmap <C-c><space> <leader>c<space>
" <==
" ==> fzf
nnoremap <C-P> :GFiles<CR>
nnoremap <leader>p :GFiles<CR>
" <==
" ==> neogit
nmap <C-g> :Neogit<CR>
" <==
" ==> orgmode
au BufRead,BufNewFile *.org set filetype=org
imap <C-C>l <Esc>gil
let g:org_heading_shade_leading_stars =1

" <==
" ==> dashboard
let g:dashboard_default_executive ='fzf'
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2

nmap <silent> <Leader>fh :History<CR>
nmap <silent> <Leader>ff :Files<CR>
nmap <silent> <Leader>tc :Colors<CR>
nmap <silent> <Leader>fa :Rg<CR>
nmap <silent> <Leader>fb :Marks<CR>
"let g:dashboard_custom_shortcut={
"\ 'last_session'       : 'SPC s l',
"\ 'find_history'       : 'SPC f h',
"\ 'find_file'          : 'SPC f f',
"\ 'new_file'           : 'SPC c n',
"\ 'change_colorscheme' : 'SPC t c',
"\ 'find_word'          : 'SPC f a',
"\ 'book_marks'         : 'SPC f b',
"\ }
"let g:dashboard_custom_shortcut_icon['last_session'] = ' '
"let g:dashboard_custom_shortcut_icon['find_history'] = 'ﭯ '
"let g:dashboard_custom_shortcut_icon['find_file'] = ' '
"let g:dashboard_custom_shortcut_icon['new_file'] = ' '
"let g:dashboard_custom_shortcut_icon['change_colorscheme'] = ' '
"let g:dashboard_custom_shortcut_icon['find_word'] = ' '
"let g:dashboard_custom_shortcut_icon['book_marks'] = ' '
let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]

" <==
" ==> ranger
let g:rnvimr_ex_enable = 1
nmap <leader>r :RnvimrToggle<CR>
" <==
" <==

" ==> normal files
autocmd FileType * inoremap {} {}<Esc>i
autocmd FileType * inoremap [] []<Esc>i
autocmd FileType * inoremap () ()<Esc>i
autocmd FileType * inoremap '' ''<Esc>i
autocmd FileType * inoremap "" ""<Esc>i
autocmd FileType * inoremap {<Enter> {<Enter><BS>}<Esc>ko
" <==
" ==>  c
autocmd FileType c map <F1> :w<CR>:!clear &&  gcc % -o %:r.out <CR> :! ./%:r.out <CR>
"autocmd FileType c map <F1> :w<CR>:!gcc % -o %:r.out <CR>
"autocmd FileType c map <F4> :!clear<CR>:!./%:r.out <CR>
" <==
" ==> python
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv','.venv', 'setup.cfg', 'setup.py']

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
"autocmd FileType tex map <F1> :w<CR> :!xelatex % <CR>
autocmd FileType tex map <F1> :w<CR> :cd %:p:h <CR> :!xelatex % <CR> :cd -<CR>
autocmd FileType tex map <F4> :!zathura %:r.pdf & <CR><CR>
autocmd FileType tex map <F2> :e %:r.log <CR>G
autocmd FileType tex inoremap <F1> <Esc>:w<CR> :!xelatex % <CR>
autocmd FileType tex inoremap 'b  \textbf{}<Esc>i
autocmd FileType tex inoremap 'i \textit{}<Esc>i
autocmd FileType tex inoremap 'e \emph{}<Esc>i
autocmd FileType tex inoremap 'u \usepackage{}<Esc>i
autocmd FileType tex inoremap "" ``''<Esc>hi
autocmd FileType tex inoremap {<Enter> {<Enter><BS>}<Esc>ko
autocmd FileType tex inoremap \ii \item
autocmd FileType tex inoremap \item \item
autocmd FileType tex inoremap <C-C><Enter> <Esc>A<Enter>\item 
"autocmd FileType tex inoremap <C-E> <Esc>bd$a\begin{<Esc>pa}<Enter><BS>\end{<Esc>pa}<Esc>ko
autocmd FileType tex inoremap <C-E> <Esc>bi\begin{<Esc>A}<Esc>yyplcwend<Esc>O


autocmd FileType tex imap <c-space> <Esc>/•<Enter>"_cl

autocmd FileType tex inoremap \frac \frac{}{•}<Esc>ba
autocmd FileType tex inoremap \\( \left(\right)•<Esc>2bhi
autocmd FileType tex inoremap \\[ \left[\right]•<Esc>2bhi
autocmd FileType tex inoremap \\{ \left\{\right\}•<Esc>2bhi
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
" ==> autostart
"autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
"autocmd BufWritePost *sxhkdrc !killall sxhkd; setsid sxhkd &
" <==


" ==> FIXME
" https://gist.github.com/vext01/16df5bd48019d451e078
" https://github.com/lervag/vimtex/issues/414
" https://wraihan.com/posts/vimtex-and-zathura/

"let g:vimtex_latexmk_options="-pdf -pdflatex='xelatex -file-line-error -synctex=1 -interaction=nonstopmode -shell-escape %S %O -verbose'"
"let g:vimtex_compiler_progname= '/usr/bin/nvr'
"let g:vimtex_view_method = 'zathura'
" toilet -f future sivmeng
" toilet -f pagga sivmeng
" <==

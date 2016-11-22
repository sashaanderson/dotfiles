set clipboard=unnamed
set et sw=4 sts=4
set nobackup
set hls
"set dir=C:/Users/<username>/AppData/Local/Temp/vim
set ignorecase smartcase
set autoindent smartindent
set ruler
set nowrapscan

syn on

au BufNewFile,BufRead   Makefile    set noet sw=8 sts=8 ts=8
au BufNewFile           *.sh        set ff=unix
au BufNewFile,BufRead   *.js,*.jsx,*.html  set sw=2 sts=2 ts=2 columns=130
au BufNewFile,BufRead   *.css       set sw=2 sts=2 ts=2
au BufNewFile,BufRead   *.sql       set sw=2 sts=2 ts=2

nnoremap <silent> <C-l> :nohl<CR><C-l>

"map ,d !!bash -c date<CR>7I><Esc>a <Esc>
"map ,dd !!bash -c "date +'\%a \%Y-\%m-\%d'"<CR>A:<Esc>

map ,dt :diffthis<CR><C-w><C-w>:diffthis<CR>
map ,du :diffupdate<CR>
map ,do :diffoff<CR><C-w><C-w>:diffoff<CR>

map ,dd !!bash -c date<CR>I>>>>>>> <Esc>0

map ,p :set invpaste<CR>:set paste?<CR>

map ,co :!bash -c "co -l %"<CR>:e!<CR>
map ,ci :!bash -c "ci -u %"<CR>:e!<CR>
map ,di :!bash -c "rcsdiff -u % \| less"<CR>

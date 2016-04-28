syntax enable
au BufNewFile,BufRead *.sv set filetype=verilog
au BufNewFile,BufRead *.vs set filetype=verilog
au BufNewFile,BufRead *.vh set filetype=verilog
au BufNewFile,BufRead *.svh set filetype=verilog
au BufNewFile,BufRead *.asm set filetype=asm
au BufNewFile,BufRead *max set filetype=asm

set ch=2
set nocompatible

map <S-Insert><MiddleMouse>
map! <S-Insert><MiddleMouse>

syntax on
set hlsearch
set mousehide
set noswapfile
set nobackup

set co=110
set lines=30
set backspace=2

set wrap
set title
set titlelen=70
set autoindent
set tabstop=4
set softtabstap=4
set showmode
set expandtab
set nu

winpos 75 100

" ------------------------------
" Highlighting, Colors and Fonts
" ------------------------------
colorscheme evening
set guifontset=-dec-terminal-medium-r-normal--14-140-75-75-c-80-is08859-1
"set guifont="DEC Terminal 11"
"set guifont="Luxi Mono 10"
"set guifontset=fixed
"set guifont=*monotype*courier*medium*r*normal*12-90-100-100-m-90*koi8-ru
"set guifont=*fixed*medium*semicondensed*120*iso8859-1*

" -----------------------------
" Search and indenting options
" -----------------------------
set ignorecase

set scs

set wrapscan

set sm

set hls

set incsearch

set lines=26

" ------------------
" Status Line, Menu 
" ------------------
set wc=<TAB>

set wmnu

set ruler

set hi=500

set showmode

set guioptions-=T

execute pathogen#infect()
let g:NERDTreeDirArrows=0

" Also, support editing of gzip-compressed files. DO NOT REMOVE THIS!
" This is also used when loading the compressed helpfiles.
augroup gzip
" Remove all gzip autocommands
au!

" Enable editing of gzipped files
" read: set binary mode before reading the file
" uncompress text in buffer after reading
" write: compress file after writing
" append: uncompress file, append, compress file
autocmd BufReadPre,FileReadPre *.gz set bin
autocmd BufReadPre,FileReadPre *.gz let ch_save = &ch|set ch=2
autocmd BufReadPost,FileReadPost *.gz '[,']!gunzip
autocmd BufReadPost,FileReadPost *.gz set nobin
autocmd BufReadPost,FileReadPost *.gz let &ch = ch_save|unlet ch_save
autocmd BufReadPost,FileReadPost *.gz execute ":doautocmd BufReadPost " . %:r

autocmd BufWritePost,FileWritePost *.gz !mv <afile> <afile>:r
autocmd BufWritePost,FileWritePost *.gz !gzip <afile>:r

autocmd FileAppendPre *.gz !gunzip <afile>
autocmd FileAppendPre *.gz !mv <afile>:r <afile>
autocmd FileAppendPost *.gz !mv <afile> <afile>:r
autocmd FileAppendPost *.gz !gzip <afile>:r
augroup END

map ` ma?module<CR>Wyiw'a:echo "module -->" @0<CR>

let b:match_words = '\<begin\>:\<end\>,'
                  \ . '\<module\>:\<endmodule\>,'
                  \ . '\<generate\>:\<endgenerate\>,'
                  \ . '\<if\>:\<end\>,'
                  \ . '-ace_args:-ace_args-,'
                  \ . '\<case\>:\<endcase\>,'
                  \ . '`ifdef:`else:`endif,'
                  \ . '`ifndef:`else:`endif,'

"Grep code base for string under cursor:
noremap K :grep! -rin "\b<C-R><C-W>\b" . <CR>:vertical copen<CR>

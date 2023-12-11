set ambw=double
set rnu
set smartindent expandtab tabstop=2 shiftwidth=2
syntax on
" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
" Use templates from $HOME/tpl
autocmd BufNewFile * silent! 0r $HOME/tpl/%:e.tpl
" .cpp files
autocmd BufNewFile *.cpp %s/FILENAME/\=expand("%:t:r")

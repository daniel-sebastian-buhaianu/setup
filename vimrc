set autoindent
set smartindent
set number
syntax on
autocmd BufNewFile * silent! 0r $HOME/Templates/vim/%:e.tpl
autocmd BufNewFile *.cpp %s/FILENAME/\=expand("%:t:r")

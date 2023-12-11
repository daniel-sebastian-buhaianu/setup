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
" Competitive programming configuration (c++ files)
autocmd BufNewFile *.cpp %s/FILENAME/\=expand("%:t:r")
function! BuildAndRun(option)
  let filename = expand("%:r")
  let valgrind = a:option == 1 || a:option == 3 ? "valgrind " : ""
  let catResult = a:option >= 2 ? " && cat ".filename.".out" : ""
  execute "!make ".filename." && ".valgrind."./".filename.catResult
endfunction
command! -nargs=0 BAR call BuildAndRun(0)
command! -nargs=0 BARV call BuildAndRun(1)
command! -nargs=0 BARADO call BuildAndRun(2)
command! -nargs=0 BARADOV call BuildAndRun(3)
function! OpenInputFile()
  let filename = expand("%:r")
  execute "!vim ".filename.".in"
endfunction
command! -nargs=0 IN call OpenInputFile()

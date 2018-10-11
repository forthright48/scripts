set exrc
set secure

set wrap
set linebreak
set nolist " list disables linebreak

set textwidth=0
set wrapmargin=0

" Save using ctrl-s
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>
vnoremap <c-s> <Esc>:w<CR>


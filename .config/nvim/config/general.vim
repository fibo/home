
"set t_Co=256

set number
set list
set listchars=tab:\|\ ,trail:☠,extends:»,precedes:«,nbsp:+

set showmatch

set ruler

" Always show status bar
set laststatus=2

" Let plugins show effects after 700ms, not 4s
set updatetime=701

" Don't let autocomplete affect usual typing habits
"set completeopt=menuone,preview,noinsert
"set completeopt=longest,menuone
set completeopt=longest,menu,menuone,preview

" File colorscheme.vim content is generated by .bashrc
source ~/.config/nvim/config/colorscheme.vim

set cursorline
set cursorcolumn
set colorcolumn=80

" Toggle cursorcolumn and cursorline when entering or leaving insert mode.

function! ToggleCurline ()
  if &cursorline && &cursorcolumn
    set nocursorline
    set nocursorcolumn
  else
    set cursorline
    set cursorcolumn
  endif
endfunction

au InsertEnter * call ToggleCurline()
au InsertLeave * call ToggleCurline()

" Add few chars to enhance completion
:set iskeyword+=\-
:set iskeyword+=/
":set iskeyword+=\.

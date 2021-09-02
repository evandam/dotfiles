source ~/.vimrc

call plug#begin('~/.vim/plugged')

" Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'
Plug 'kien/rainbow_parentheses.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/jsonc.vim'

call plug#end()

" Rainbow parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_checkers = ['flake8']


" Allow comments in JSON
au BufReadPost *.json set syntax=jsonc

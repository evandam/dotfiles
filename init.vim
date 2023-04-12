source ~/.vimrc

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/jsonc.vim'

Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'

call plug#end()

set conceallevel=0

" Allow comments in JSON
au BufReadPost *.json set syntax=jsonc

lua require("init")

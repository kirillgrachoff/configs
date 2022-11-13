set nocompatible
set encoding=utf-8

set tabstop=4
set smartindent
set shiftwidth=4
set expandtab

set clipboard+=unnamedplus

syntax on

set number
set relativenumber
set scrolloff=2
set nowrap

" search text
" set hlsearch " highlight search results permanently
set incsearch
set ignorecase
set smartcase


set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

filetype off

call plug#begin()

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()
filetype plugin indent on

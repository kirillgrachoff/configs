set nocompatible
set encoding=utf-8

" set updatetime=300

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
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': 'yarn install --frozen-lockfile' }

call plug#end()
filetype plugin indent on

let g:go_def_mapping_enabled = 0

" for coc.nvim

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

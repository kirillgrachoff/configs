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

" terminal mode
:tnoremap <Esc> <C-\><C-n>


set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

filetype off

call plug#begin()

" NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Go
Plug 'fatih/vim-go', { 'for': 'go' }
" Language Server
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Git Blame
Plug 'apzelos/blamer.nvim'
" Markdown
" Plug 'iamcco/markdown-preview.nvim', { 'for': ['md', 'markdown', 'vim-plug'], 'do': { -> mkdp#util#install() } }
" Bazel
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'
" Terminal
" Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

call plug#end()
filetype plugin indent on

" disable vim-go to use coc.nvim
let g:go_def_mapping_enabled = 0

" blamer
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_date_format = '%Y-%m-%d'

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

" Opend NERDTree automatically
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close if only NERDTree exists
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

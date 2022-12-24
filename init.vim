set nocompatible
set encoding=utf-8

set updatetime=300

set tabstop=4
set smartindent
set shiftwidth=4
set expandtab

set clipboard+=unnamedplus

syntax on

set number
" set relativenumber
set scrolloff=2
set nowrap

" search text
" set hlsearch " highlight search results permanently
set incsearch
set ignorecase
set smartcase

" terminal mode
:tnoremap <Esc> <C-\><C-n>
" tabs
:nnoremap <C-t> :term<CR>:set nonumber<CR>:set norelativenumber<CR>i


set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

filetype off

call plug#begin()

" NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Go
Plug 'fatih/vim-go', { 'for': 'go' }
" Language Server
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" CocInstall coc-rust-analyzer
" CocInstall coc-go
" CocInstall coc-clangd
" Markdown
" Plug 'iamcco/markdown-preview.nvim', { 'for': ['md', 'markdown', 'vim-plug'], 'do': { -> mkdp#util#install() } }
" Bazel
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'
" FZF
Plug 'junegunn/fzf' " fzf needed
Plug 'junegunn/fzf.vim'
" Git (required by fzf.vim#Commits)
Plug 'tpope/vim-fugitive'
" Telescope (FZF drop-n-replacement)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' } " ripgrep needed

call plug#end()
filetype plugin indent on

" disable vim-go to use coc.nvim
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

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" gh - get hint on whatever's under the cursor
nnoremap <silent> gh :call <SID>show_documentation()<CR>

" Opend NERDTree automatically
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close if only NERDTree exists
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

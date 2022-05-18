
call plug#begin(stdpath('data') . '/plugged')

" Editor niceties
Plug 'editorconfig/editorconfig-vim'
" Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Firefox / Chrome plugin
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Git niceties 
" Plug 'airblade/vim-gitgutter'
" Plug 'gregsexton/gitv'
Plug 'junegunn/vim-github-dashboard'
Plug 'idanarye/vim-merginal', { 'branch': 'develop' }
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'liuchengxu/eleline.vim'

" Color Schemes
Plug 'altercation/vim-colors-solarized'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" LSP + linters + IDE
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'jmeekhof/gsql-vim'

Plug 'majutsushi/tagbar'
" Plug 'w0rp/ale'

" TOML
Plug 'cespare/vim-toml'

" Terminal, shell plugins
Plug 'dag/vim-fish'
Plug 'tmux-plugins/vim-tmux'

" Language Plugins
"" Go
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}

"" Haskell
Plug 'nbouscal/vim-stylish-haskell'

"" NGINX
Plug 'chr4/nginx.vim'

"" PHP
" Plug 'beanworks/vim-phpfmt'
"" jsx / typescript
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'udalov/kotlin-vim'

call plug#end()

if exists('g:started_by_firenvim')
  set laststatus=0
  set background=light
else
  set laststatus=2
endif

" Use the system install fzf
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf

colorscheme solarized
set number relativenumber
set ai
set nowrap
set ignorecase
set gdefault
set showmatch
set background=dark
set colorcolumn=80
set updatetime=300
set wildignore=bazel-*/**,.git/**,node_modules/**

highlight Normal ctermfg=11 ctermbg=None
highlight VertSplit cterm=None ctermfg=12 ctermbg=None
highlight StatusLine cterm=underline ctermfg=12 ctermbg=None
highlight StatusLineNC cterm=underline ctermfg=12 ctermbg=None
highlight LineNr ctermfg=12 ctermbg=None
highlight LineNrAbove ctermfg=12 ctermbg=None
highlight LineNrBelow ctermfg=12 ctermbg=None
highlight CursorLineNr ctermfg=12 ctermbg=None
highlight FoldColumn ctermfg=12 ctermbg=None
highlight SignColumn ctermfg=12 ctermbg=None
highlight Folded cterm=bold ctermfg=2 ctermbg=None

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" call status#Autocmd()

"
" Minimal statusline. File path horizontal space line number of lines
" set statusline=
" set statusline+=%#PmenuSel#
" set statusline+=%{StatuslineGit()}
" set statusline+=%#LineNr#
" set statusline+=
" set statusline+=\ %f
" set statusline+=%m 
" set statusline+=%=
" set statusline+=%#CursorColumn#
" set statusline+=\ %y
" set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" set statusline+=\[%{&fileformat}\]
" set statusline+=\ %p%%
" set statusline+=\ %l:%c
" set statusline+=\ 

"set statusline+=%=
"set statusline+=..\ %l/%L\ ..
 
set cursorline
autocmd WinEnter,BufEnter,BufWinEnter * set cursorline
autocmd WinLeave,BufLeave,BufWinLeave * set nocursorline
highlight CursorLine cterm=None ctermbg=0

" A little of line number magic
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


" Airline setup
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
" Enable the list of buffers

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Python setup
let g:python_host_prog = '/Users/jmeekho/.pyenv/versions/neovim2/bin/python'
" let g:python3_host_prog = 'toolbox run -c nvim-python3 python3'

" FZF Setup
" Within the fzf window, open the file in a new tab
" horizontal split
" vertical split
let g:fzf_action = {
      \ 'ctrl-t': 'tab split', 
      \ 'ctrl-x': 'split',     
      \ 'ctrl-v': 'vsplit'     
      \ }
let g:fzf_history_dir =  '~/.local/data/fzf-history'

" Tagbar Setup
map <C-a> :TagbarToggle<CR>


" TextEdit might fail if hidden is not set.
set hidden
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
"  nmap <leader>T :enew<cr>

" Move to the next buffer
" nmap <leader>l :bnext<CR>

" Move to the previous buffer
" nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
" nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
" nmap <leader>bl :ls<CR>

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2


" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Tab completion 
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" Preview Window
let g:asyncomplete_auto_completeopt = 0

set completeopt=menuone,noinsert,noselect,preview

" Register Gopls for vim-lsp
if executable('gopls')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
  autocmd BufWritePre *.go LspDocumentFormatSync
endif

" Register intelephense for PHP
if executable('intelephense')
  augroup LspPHPIntelephense
    au!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'intelephense',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
        \ 'whitelist': ['php'],
        \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
        \ 'workspace_config': {
        \   'intelephense': {
        \     'files': {
        \       'maxSize': 1000000,
        \       'associations': ['*.php', '*.phtml'],
        \       'exclude': [],
        \     },
        \     'completion': {
        \       'insertUseDeclaration': v:true,
        \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
        \       'triggerParameterHints': v:true,
        \       'maxItems': 100,
        \     },
        \     'format': {
        \       'enable': v:true
        \     },
        \   },
        \ }
        \})
  augroup END
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

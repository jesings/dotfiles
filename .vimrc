set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set number
set cin
set nocp
set nocompatible              " be iMproved, required
syntax on

"Automatically install vim plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader = ","

nnoremap <up> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>
nnoremap <down> <nop>
vnoremap <up> <nop>
vnoremap <right> <nop>
vnoremap <left> <nop>
vnoremap <down> <nop>
inoremap <up> <nop>
inoremap <right> <nop>
inoremap <left> <nop>
inoremap <down> <nop>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

xnoremap "*y y:call system("wl-copy", @")<cr>
nnoremap "*y "9yy:call system("wl-copy", @9)<cr>
xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+y "9yy:call system("wl-copy", @9)<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p

set noshowmode

set hls
nnoremap <silent> <leader>, :noh<CR>
nnoremap <leader>a ^whv],hdli v$hp^wP

nnoremap <leader>b !!bash<CR>
nnoremap <leader>c !!bc -l<CR>
nnoremap <leader>p !!python<CR>
nnoremap <leader>u :source ~/.vimrc<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
noremap <C-T> :<C-U>NERDTreeToggle<CR>
function SetComplete()

  call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  call plug#end()
  " Give more space for displaying messages.
  set cmdheight=2

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=300

  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  if has('patch8.1.1068')
    " Use `complete_info` if your (Neo)Vim version supports it.
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  endif

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Highlight the symbol and its references when holding the cursor.

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)
  "autocmd CursorHold * silent call CocActionAsync('highlight')
  let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'readonly', 'filename', 'modified'],
        \             [ 'cocstatus', 'currentfunction'] ]
        \ },
        \ 'component_function': {
        \   'cocstatus': 'coc#status',
        \   'currentfunction': 'CocCurrentFunction'
        \ },
        \ }
endfunction

command -nargs=0 Complete :call SetComplete() 

call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-apathy'
Plug 'christoomey/vim-sort-motion'
Plug 'tmhedberg/matchit'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'kmyk/sdl2.vim'
Plug 'bfrg/vim-cpp-modern'
Plug 'tpope/vim-rhubarb'
Plug 'calculuswhiz/vim-GAS-x86_64-highlighter'
Plug 'tpope/vim-eunuch'
Plug 'PeterRincker/vim-argumentative'
Plug 'Siphalor/vim-atomified'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/calendar.vim'
Plug 'justinmk/vim-syntax-extra'
Plug 'ap/vim-css-color'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'on': 'Complete'}
Plug 'tpope/vim-obsession'
call plug#end()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:calendar_google_calendar = 1

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
let g:user_emmet_install_global = 0
autocmd FileType html,css,js EmmetInstall

autocmd BufWritePre * :normal g_ld$ 

if !has("gui_running")
	let &t_AB="\e[48;5;%dm"
	let &t_AF="\e[38;5;%dm"
    colorscheme atomified
endif

hi Normal ctermbg=234 ctermfg=White guifg=Black guibg=White
set encoding=utf-8
packadd termdebug
"OH MY GOD GDB INTEGRATION IS SO GOOD
nnoremap gdb :Termdebug<CR>
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
let g:calendar_first_day = "sunday"

set guifont=Inconsolata\ for\ Powerline\ Nerd\ Font\ Complete\ Mono\ 12
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

tnoremap <silent> <C-h> <C-\><C-n>:TmuxNavigateLeft<cr>
tnoremap <silent> <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
tnoremap <silent> <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
tnoremap <silent> <C-l> <C-\><C-n>:TmuxNavigateRight<cr>

set ttymouse=sgr

set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set number
set cin
set nocp
set nocompatible              " be iMproved, required
set splitbelow splitright
syntax on

set wildignore=*.o,*.obj,*.bak,*.exe

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

nnoremap cC :!gcc <C-r>%<cr>

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
Plug 'tpope/vim-obsession'
Plug 'unblevable/quick-scope'
Plug 'vim/killersheep'
call plug#end()

let g:calendar_google_calendar = 1

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
let g:user_emmet_install_global = 0
autocmd FileType html,css,js EmmetInstall

autocmd BufWritePre * :normal g_ld$

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
if !has("gui_running")
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
endif
colorscheme atomified

"hi Normal ctermbg=234 ctermfg=White guifg=Black guibg=White
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi Terminal ctermbg=NONE guibg=NONE
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

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

tnoremap <silent> <C-h> <C-\><C-n>:TmuxNavigateLeft<cr>
tnoremap <silent> <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
tnoremap <silent> <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
tnoremap <silent> <C-l> <C-\><C-n>:TmuxNavigateRight<cr>

nnoremap <space>1 1gt
nnoremap <space>2 2gt
nnoremap <space>3 3gt
nnoremap <space>4 4gt
nnoremap <space>5 5gt
nnoremap <space>6 6gt
nnoremap <space>7 7gt
nnoremap <space>8 8gt
nnoremap <space>9 9gt

set ttymouse=sgr

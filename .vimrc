colorscheme elflord

set t_Co=256
set number
set ruler
set shiftwidth=4
set tabstop=8
set expandtab
set softtabstop=4
set autoindent
set cindent
syntax on


call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'lervag/vimtex'

call plug#end()
runtime macros/matchit.vim


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



set nocompatible
set backspace=indent,eol,start
set number
set hidden

syntax on
filetype plugin indent on

:let g:latex_to_unicode_tab = "on"

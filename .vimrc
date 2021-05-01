" placing swap files in a backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" handle screen splits
set splitbelow
set splitright
" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set relativenumber

" code collapsing stuff
set foldmethod=indent
set foldlevel=99
" fold with spacebar instead of za
nnoremap <space> za

set clipboard=unnamedplus
nmap <F6> :NERDTreeToggle<CR>
map <F4> :CondaChangeEnv<CR>

" suppress vim-conda related messages
let g:conda_startup_msg_suppress = 1
let g:conda_startup_wrn_suppress = 1

" for linting
let g:ale_linters = {
	\ 'python' : ['flake8', 'pylint'],
	\} " add more linting here if needed
let g:ale_fixers = {
	\ 'python' : ['yapf'],
	\}
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1

" for vim-plug stuff
call plug#begin('~/.vim/plugged')

" folding improved
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim' 
Plug 'davidhalter/jedi-vim'
Plug 'cjrh/vim-conda'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
Plug 'junegunn/fzf.vim' " for fuzzy searching
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'scrooloose/nerdcommenter' " for commenting out lines
Plug 'liuchengxu/vista.vim' " tagbar
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'jiangmiao/auto-pairs' " auto quotation and paranthesis pairing
Plug 'joshdick/onedark.vim' " theme
Plug 'sheerun/vim-polyglot' " language support
Plug 'Vimjas/vim-python-pep8-indent' " PEP8 plugin
Plug 'dense-analysis/ale' " linting and autofixing

call plug#end()

colorscheme onedark

" remap :Files search to CTRL-F
nnoremap <silent> <C-F> :Files<CR>
" remap :Rg for searching within files
nnoremap <silent> <Leader>f :Rg<CR>

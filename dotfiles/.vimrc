set nocompatible


"""""""""""""""""""""""""""""""""" PLUGINS

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-tbone'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-perl/vim-perl'
"Plugin 'plasticboy/vim-markdown'


call vundle#end()
filetype plugin indent on


"""""""""""""""""""""""""""""""""" BASIC SETUP

" colors
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" ui
set cursorline
set number
set laststatus=2
set modeline
set modelines=4
set nowrap

" indentation
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set smarttab

" editing
set backspace=indent,eol,start
set showmatch
set hidden
set autoread
set scrolloff=3
set encoding=utf-8
set complete-=i
au CursorHold * checktime

" cmds
set history=1000
set showcmd
set wildmode=longest,list
set wildmenu
set cmdheight=1

" backups
set nowritebackup
set noswapfile
set nobackup

" search
set incsearch
set hlsearch
set ignorecase
set smartcase

augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!

  " Return to last edit position when opening files (You want this!)
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  "hive filetype
  autocmd BufNewFile,BufRead *.hql set filetype=hive expandtab
  autocmd BufNewFile,BufRead *.bql set filetype=hive expandtab

  " indentation setup
  autocmd FileType text setlocal textwidth=78
  autocmd FileType ruby,hive,yaml set ai sw=2 sts=2 et
  autocmd FileType html,javascript,sass set ai sw=4 sts=4 et
  autocmd FileType python,perl set sw=4 sts=4 et

augroup END


"""""""""""""""""""""""""""""""""" FUNCTIONS
function! CallAsync(cmd)
  exe ':silent !' . a:cmd . ' > /dev/null 2>&1 &'
  exe ':redraw!'
endfunction

function! WriteToQuickfix(cmd)
  let l:output = system(a:cmd)
  cexpr l:output
  "caddexpr ""
  "cwindow
  exe ':redraw!'
endfunction

" Multipurpose tab: indent or complete
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction

" rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

function! TmuxPaste(pane, prefix, sufix) range
  let keys = join(filter(getline(a:firstline, a:lastline), "!empty(v:val)"), "\r")
  call tbone#send_keys(a:pane, a:prefix . keys . a:sufix)
endfunction


"""""""""""""""""""""""""""""""""" SHORTCUTS

" remaps
let mapleader=","
imap jj <ESC>

" copy and paste
vmap <leader>y :w !ssh localhost -p 2222 pbcopy<CR><CR>
nmap <leader>p :r !ssh localhost -p 2222 pbpaste<CR>

" format the entire file
nmap <leader>fef ggVG=

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" frequently used commands
nnoremap <space> :nohlsearch<CR>
nnoremap <leader>g :Ggrep '\b<cword>\b'<CR>
nnoremap <leader>d :Dispatch<cr>
nnoremap <leader>mv :call RenameFile()<cr>

" smart tabs
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

" trailling space
nnoremap <C-@> :s/\s\+$//e<cr>:nohlsearch<cr>

" Move a line of text using ALT+[jk]
nmap <c-j> mz:m+<cr>`z
nmap <c-k> mz:m-2<cr>`z

" open file in current directory
cnoremap <expr> %% expand('%:h').'/'
map <leader>e :edit %%
map <leader>v :view %%


"""""""""""""""""""""""""""""""""" PLUGINS

" Fugitive
autocmd QuickFixCmdPost *grep* cwindow

" NERDTree
nmap <leader>s :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" Syntastic
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_ruby_exec = '~/.rvm/rubies/ruby-2.0.0-p0/bin/ruby'

" CtrlP
let g:ctrlp_by_filename = 0
let g:ctrlp_max_files = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cmd = 'CtrlPMixed'

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Tmux
map <leader>t  :call TmuxPaste("bottom-right", "\r", "\r") <CR>
map <leader>tr :call TmuxPaste("bottom-right", "%cpaste\r", "\r--\r") <CR>


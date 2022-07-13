filetype plugin indent on

" Backup, swap and undo file locations
call system('mkdir -p ~/.vim/backup')
call system('mkdir -p ~/.vim/swap')
call system('mkdir -p ~/.vim/undo')
set backup
set backupdir=~/.vim/backup//,.
set swapfile
set directory=~/.vim/swap//,.
set undofile
set undodir=~/.vim/undo//,.

" Syntax highlighting
set t_Co=256
colorscheme Tomorrow-Night
syntax on

" Show line numbers
set number

" Show whitespace
set list

" Cursor and column guide highlighting
set cursorline
let &colorcolumn="80"

" Selected word highlighting
set hlsearch
"noremap <Esc> :noh<CR><Esc>
highlight Search cterm=underline ctermfg=none ctermbg=none
" Do not interfere with escape key sequence
"nnoremap <esc>^[ <esc>^[

" Mouse mode
set mouse=a
set ttymouse=xterm2
map <2-LeftMouse> *

" Leader key
let mapleader=' '

" Easier common commands
inoremap <C-space> <Esc>
nnoremap <Leader>e :edit<Space>
nnoremap <Leader>E :edit ~/Projects/
nnoremap <Leader>w :write<CR>
nnoremap <Leader>W :write!<CR>
nnoremap <Leader>s :saveas<Space>
nnoremap <Leader>S :saveas!<Space>
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>Q :quit!<CR>
" Repeat last command
nnoremap <Leader>c @:

" Start/End of line navigation
nnoremap <Leader>, ^
nnoremap <Leader>. $

" Search and replace
"nnoremap <C-s> :%s//gc<left><Left><Left>

" Reload ~/.vimrc and current file
" WARN will attempt to save current file
nnoremap <Leader>r :write<CR>:source ~/.vimrc<CR>:edit<CR>

" Tab pages
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap te :tabedit<Space>
nnoremap tE :tabedit ~/Projects/
nnoremap tt :tabnew<CR>
nnoremap tm :tabm<Space>
nnoremap td :tabclose<CR>

" Folding using f key
nnoremap f za
" Use manual foldmethod when in insert mode to avoid fold expansion on
" unmatched parentheses.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" Start a note
nnoremap <leader>n :tabedit ~/Notes/<C-R>=strftime("%Y-%m-%dT%T%z")<CR>.md<CR>:lcd %:p:h<CR>1<C-G><CR>

" Change TODO list marker
nnoremap <Leader>m ^r

" Auto reload changed files
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim#383044
autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
set autoread

" Use Ctrl+XCV clipboard as default unnamed register
set clipboard=unnamedplus

" Smart case regex - override with \c or \C
set ignorecase
set smartcase

" Split panes
" More natural defaults
set splitbelow
set splitright

" Proper shell - for aliases, etc.
" This seems to cause issues with Vim suspending in Zsh.
"set shell=$SHELL\ -i

" vim-plug - plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

"Plug 'tpope/vim-sleuth'  " Ignores user configed `expandtab`
Plug 'IN3d/vim-raml'
Plug 'Konfekt/vim-alias'
Plug 'Rykka/InstantRst'
Plug 'Rykka/riv.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'exu/pgsql.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'jgdavey/tslime.vim'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/indentpython.vim'

call plug#end()

" YouCompleteMe config
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_goto_buffer_command = 'new-or-existing-tab'
let g:ycm_python_binary_path = 'python'
nnoremap <leader>* :YcmCompleter GoTo<CR>
nnoremap <leader>** :YcmCompleter GoToReferences<CR>

" tslime - run Vim buffer in next Tmux pane
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

" Sygnify - diff gutter signs
let g:signify_vcs_list = ['git', 'svn']
let g:signify_sign_show_count = 0
let g:signify_sign_add = " +"
let g:signify_sign_delete = " _"
let g:signify_sign_delete_first_line = " ‾"
let g:signify_sign_change = " ~"
let g:signify_sign_changedelete = "~_"
highlight SignifySignAdd ctermfg=040 guibg=black
highlight SignifySignDelete ctermfg=196 guibg=black
highlight SignifySignChange ctermfg=220 guibg=black
highlight SignifySignChangeDelete ctermfg=208 guibg=black

" Linter options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers = ["python", "flake8"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_error_symbol = "*e"
let g:syntastic_warning_symbol = "*w"
let g:syntastic_style_error_symbol = " e"
let g:syntastic_style_warning_symbol = " w"
highlight SyntasticErrorSign ctermfg=196 guibg=black
highlight SyntasticWarningSign ctermfg=220 guibg=black

" Folding options
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0

" fzf - fuzzy finder
"set rtp+=~/.fzf
set rtp+=/usr/local/opt/fzf
nnoremap <Leader>o :FZF<CR>
nnoremap <Leader>O :FZF ~/Projects/<CR>
nnoremap <Leader>p :tabedit<CR>:FZF!<CR>
nnoremap <Leader>P :tabedit<CR>:FZF! ~/Projects/<CR>

" Open .psql files as pgsql filetype
autocmd BufNewFile,BufRead *.psql setf pgsql

" Powerline
"source /Users/garyfernie/.pyenv/versions/2.7.10/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
"set laststatus=2
py3 import powerline.vim; powerline.vim.setup()

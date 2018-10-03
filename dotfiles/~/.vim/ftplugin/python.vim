" Python indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
" Remove Python after-colon indenting.
" Vim does this by default, and it's rarely useful.
"autocmd FileType python setlocal indentkeys-=<:>

" Code folding
" Redundant - SimpylFold plugin
"set foldmethod=indent
"set foldlevel=99

" Column guide for docstrings and code
"set textwidth=72
let &colorcolumn="73,80"
set formatoptions+=croqn1j
set formatoptions-=twal

" Virtualenv evaluation
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

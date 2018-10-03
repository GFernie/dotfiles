" Shell filetype options
" Values adhere to Google's Shell Stye Guide:
" https://google.github.io/styleguide/shell.xml

" 2-space indent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

" Column guide max line length
let &colorcolumn="81"

" Comments hard wrapping; code is not automatically wrapped
set textwidth=80
set formatoptions+=croqanj
set formatoptions-=t

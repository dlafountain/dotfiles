call pathogen#infect()
set nocompatible
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
syntax on
filetype on
filetype indent on
filetype plugin on
compiler ruby
set wrap
set ruler
set number
set nu

" colorscheme codeschool
colorscheme elflord

set hlsearch
noremap <F4> :set hlsearch! hlsearch?<CR>

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

let g:syntastic_python_checkers=['flake8']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction
map <Leader>w :call HandleURI()<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Highlight trailing whitespace on lines
match Todo /\s\+$/

"Strips trailing whitepsace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


execute pathogen#infect()


set nocompatible                " choose no compatibility with legacy vi
set encoding=utf-8
filetype plugin indent on       " load file type plugins + indentation

" Visual
syntax enable
filetype on
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized
set number      " show numbers
set cursorline  " highlight line of the cursor
set showcmd     " show partial commands below the status line
set scrolloff=3 " have some context around the current line always on screen
set wrap        " Enable wrapping of text
set linebreak   " Only wrap character on break option
set showmatch   " highlight matching braces

" Folding
set foldenable          " enable folding
set foldmethod=indent   " fold based on indent level
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" Syntax highlighting

"statusline
"set laststatus=2                              " display status line
"set statusline=
"set statusline+=%<\                           " cut at start
"set statusline+=%-40f\                        " path
"set statusline+=%=%1*%y%*%*\                  " file type
"set statusline+=%{strlen(&fenc)?&fenc:&enc},  " encoding
"set statusline+=%{fugitive#statusline()}      " Show git branch
"set statusline+=%10((%l,%c)%)\                " line and column
"set statusline+=%P                            " percentage of file
"set statusline+=%#warningmsg#                 " show syntastic messages
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" Vim-Airline
let g:airline_powerline_fonts = 1 "automatically download symbols
let g:airline_theme = 'light'     "set colours
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s: '


" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

" Searching
set hlsearch                       " highlight matches
set incsearch                      " incremental searching
set ignorecase                     " searches are case insensitive...
set smartcase                      " ... unless they contain at least one capital letter
nnoremap <CR> :nohlsearch<CR>/<BS> " remove search highlights with enter in command mode

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

" Auto-reload buffers when file changed on disk
set autoread

" Disable swap files; systems don't crash that often these days
set updatecount=0

" Split Windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" map []
nnoremap ä [
nnoremap Ä ]

" CRTLP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map <leader>y :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$\|.node_modules',
  \ 'file': '\.exe$\|\.so$\|\.dat$',
  \ }

" Emmet
let g:user_emmet_expandabbr_key = '<S-tab>'
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Nerdtree
nmap <silent> <C-y> :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif " Open Nerdtree if vim is opened without a file
let NERDTreeShowHidden = 1 "Show dotfiles

" Syntastic
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_javascript_jshint_args = '--config /Users/ds/.jshintrc'
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_coffee_checkers = ['coffeelint', 'coffee']
"let g:syntastic_javascript_checkers = ['jsxhint'] "Add jsx support
"let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper' "Add jsx support
let g:syntastic_auto_jump = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

" Mustache
let g:mustache_abbreviations = 1 " activate abbreviations

" Ultisnips
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

" vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" tagbar
nmap <F8> :TagbarToggle<CR>

" scala
au BufRead,BufNewFile conf/routes set filetype=play2-routes
au BufRead,BufNewFile conf/*.conf set filetype=play2-conf
au BufRead,BufNewFile */*.scala.html set filetype=play2-html

" pathogen plugin
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
set modelines=0

" color settings (solarized)
let solarized_diffmode="high"
set background=dark
colorscheme solarized
call togglebg#map("")

" appereance
syntax on
set relativenumber
set cursorline
set cursorcolumn
set wrap
set linebreak
set showbreak=…


set autoindent
set smartindent
set expandtab
set softtabstop=2
set tabstop=2
set mouse=a
set sw=2
set directory=~/.vimbackup//
set undofile
set pastetoggle=<Leader>p

" statusline
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

" navigation
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
set scrolloff=7

map <c-l> <c-w>l
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k

" lazy commands
nnoremap <Leader>nt :tabnew.<CR>
nnoremap <Leader>ns :vne.<CR>
nnoremap ; :
vnoremap ; :
inoremap ;; <Esc>:
inoremap jj <Esc>

" search
set ignorecase
set smartcase
set hlsearch
nnoremap <Leader>s :nohlsearch<CR>
set incsearch

" szamok incrementalasa byobu alatt is (c-a atirhatatlan byobu parancs)
map <c-c> <c-a>

" kodblokk osszecsukasa
nnoremap <c-f> zf%
nnoremap <BS> zfa{

" sorvegi szokozok automatikus kiemelese
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" sorvegi szokozok kiemelesenek ki/bekapcsolasa
nnoremap <Leader>ws :match ExtraWhitespace /\s\+$/<CR>
nnoremap <Leader>wh :match<CR>
" sorvegi szokozok torlese
nnoremap <Leader>wr :%s/\s\+$//e<CR>

" kijelolt szoveg csereje
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" frugitive mappings
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gp :diffput<CR>:diffupdate<CR>
vnoremap <Leader>gp :diffput<CR>:diffupdate<CR>
nnoremap <Leader>gg0 :diffget //0<CR>:diffupdate<CR>
nnoremap <Leader>gg2 :diffget //2<CR>:diffupdate<CR>
nnoremap <Leader>gg3 :diffget //3<CR>:diffupdate<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>

" gist settings
let g:gist_clip_command = 'pbcopy' "mac only
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1

" syntastic settings
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1

" quickfix list navigation
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

" Command-T settings
let g:CommandTMaxHeight=15

" gundo mappings
nnoremap <Leader>u :GundoToggle<CR>
inoremap <Leader>u <Esc>:GundoToggle<CR>

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

if has("autocmd")
  " Drupal *.module, *.test and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
endif

autocmd FileType css call SuperTabSetDefaultCompletionType("<c-x><c-o>")

filetype plugin on

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" vim-autoclose bugfix for xterm
if !has("gui_running")
  let g:AutoClosePreservDotReg = 0
endif

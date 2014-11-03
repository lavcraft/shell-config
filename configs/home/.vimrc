" .vimrc of Tolkachev Kirill


" ============================================================================
" Early settings
" ============================================================================

" Leader key
let mapleader=" "


" ============================================================================
" Plugins
" ============================================================================




" ============================================================================
" General settings
" ============================================================================

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc nested source %

" Disable paste mode when leaving insert mode
autocmd! InsertLeave * set nopaste

" Paste without manual switching
map <F5> :set paste<CR>i
imap <F5> <Esc>:set paste<CR>i<Right>

" Allow unsaved changes when opening another file
set hidden

" Disable swap files
" set noswapfile

" Swap file directory
set dir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Search with smart case
set ignorecase
set smartcase

" Substitute all matches in the line
set gdefault

" Share the system clipboard
if has('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

" Omni-completion
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

" Wildmenu
set wildmenu
set wildmode=longest:full,full
set wildcharm=<Tab>
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.pyc,*/.ropeproject/*,*/.idea/*,*.egg,*.egg-info/*,*build/*,*bin/*,*target/*

" Scrolling by blocks
let &scrolljump=&lines / 2 - 1

" Tab config
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Disable folding
set nofoldenable

" Move backup files
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Line length and wrapping
set textwidth=80
set colorcolumn=81
highlight ColorColumn ctermbg=233

" Spell checking
autocmd BufRead *.tex,*.md setlocal spell spelllang=en_au
set spellfile=~/.vim/spell.en.add
nmap <leader>= 1z=

" Yaml
autocmd BufReadPre *.yaml,*.yml setlocal nowrap
autocmd BufReadPre *.yaml,*.yml setlocal tabstop=2
autocmd BufReadPre *.yaml,*.yml setlocal softtabstop=2
autocmd BufReadPre *.yaml,*.yml setlocal shiftwidth=2

" Enable C-Tab
imap <Esc>[27;5;9~ <C-Tab>
nmap <Esc>[27;5;9~ <C-Tab>


" ============================================================================
" Appearance
" ============================================================================

" Hide black line tildas
highlight NonText ctermfg=0

" Coloring
hi StatusLine   cterm=reverse ctermfg=233 ctermbg=4
hi StatusLineNC cterm=reverse ctermfg=233 ctermbg=8
hi VertSplit    cterm=reverse ctermfg=233 ctermbg=8
hi Search       ctermbg=NONE
hi Error        ctermbg=NONE ctermfg=red
hi SignColumn   ctermbg=233
hi FoldColumn   ctermbg=233

" Color in text files
autocmd FileType text set filetype=markdown


" ============================================================================
" Movement: command-line
" ============================================================================

" Better command-line movement
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Force saving that requires root permissions
cmap w!! %!sudo tee > /dev/null %


" ============================================================================
" Movement: normal mode
" ============================================================================

" Scroll screen with the cursor
noremap <C-j> gj<C-e>
noremap <C-k> gk<C-y>

" Left / right
noremap <C-h> h
noremap <C-l> l

" Home row beginning / end of line
noremap h ^
noremap l $

" Search the current word in front / behind
noremap ( #
noremap ) *

" Jump to the middle of the line
nnoremap <silent> gm :call cursor(0, len(getline('.'))/2)<CR>


" ============================================================================
" Movement: insert mode
" ============================================================================

" Basic
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-l> <Right>
inoremap <C-h> <Left>

" Beginning / end of line
inoremap <C-a> <Home>
inoremap <C-e> <End>

" Delete a word forward
inoremap <C-d> <C-o>dw

" Dedent the current line
inoremap <C-f> <C-d>


" ============================================================================
" Movement: operator-pending mode
" ============================================================================

xnoremap p ip
xnoremap ( i(
xnoremap { i{
xnoremap [ i[
xnoremap < i<
xnoremap ` i"
xnoremap ' i'
xnoremap " i"

onoremap p ip
onoremap ( i(
onoremap { i{
onoremap [ i[
onoremap < i<
onoremap ` i"
onoremap ' i'
onoremap " i"


" ============================================================================
" Editing
" ============================================================================

" Escape
inoremap jk <Esc>`^
inoremap <C-q> <Esc>`^
noremap <C-q> <Esc>
vnoremap <C-q> <Esc>
cmap <C-q> <C-c>

" Easy redo
nnoremap U <C-r>

" Reflow a paragraph
vmap <leader>q gq
nmap <leader>q gqap

" Moving blocks of text in visual mode
vnoremap < <gv
vnoremap > >gv

" Copy the selected region and jump to its end
" vmap y y`]

" Select all text
map <leader>a ggVG

" Duplicate a line and comment the first copy
nmap gcd yyPgcc

" Duplicate a region and comment the first copy
vmap gcc gc<Esc>

" Duplicate a region and comment the first copy
vmap gcd yPgvgc<Esc>

" Indent everything
noremap <leader>I gg=G<C-o><C-o>

" Indent selection in visual mode
vnoremap <leader>i =

" Indent the current line
noremap <leader>i v=

" Switch capitalization of the first letter of the current word
nmap crf m`T<Space>~``

" Change current word - kill
noremap K ciw

" Change current WORD - kill
" noremap J ciW

" Change until punctuation
nmap J ciu

" Join lines
nnoremap <leader>J J

" Insert a space
nnoremap <leader><Space> i<Space><Esc>

" ============================================================================
" Editor control
" ============================================================================

" Enter the command-line mode
noremap <CR> :

" Save
noremap  <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-c>:update<CR>
inoremap <silent> <C-s> <C-o>:update<CR>

" Quit
noremap Q :quit<CR>

" Jump between windows
noremap <leader>w <C-w>w
" noremap <Up> <C-w>k
" noremap <Down> <C-w>j
" noremap <Left> <C-w>h
" noremap <Right> <C-w>l

" Jump between buffers
" noremap <silent> <leader>j :bnext<CR>
" noremap <silent> <leader>k :bprev<CR>
noremap <silent> <leader>l :b#<CR>

" Delete the current buffer
noremap <leader>d :bdelete<CR>

" Edit a file
noremap <leader>e :e <Tab>

" Very magic regex search by default
nnoremap / /\v

" Open .vimrc
nnoremap <leader>ve :split $MYVIMRC<CR>

" Source .vimrc
nnoremap <leader>vs :source $MYVIMRC<CR>i<Esc>


" ============================================================================
" Java key bindings (eclim)
" ============================================================================

let g:EclimLoggingDisabled = 1
let g:EclimJavaSearchMapping = 0
let g:EclimJavaSearchSingleResult = 'edit'
let g:EclimJavaHierarchyDefaultAction = 'edit'
let g:EclimJavaCallHierarchyDefaultAction = 'edit'
autocmd FileType java nnoremap <localleader>l :lfirst<CR>
autocmd FileType java nnoremap <localleader>o :CtrlP src<CR>
autocmd FileType java nnoremap <localleader>m :CtrlP src/main<CR>
autocmd FileType java nnoremap <localleader>t :CtrlP src/test<CR>
autocmd FileType java nnoremap <localleader>j :CtrlP src/main/java<CR>
autocmd FileType java nnoremap <silent> <buffer> <localleader>i :JavaImport<CR>
autocmd FileType java nnoremap <silent> <buffer> <localleader>I :JavaImportOrganize<CR>
autocmd FileType java nnoremap <silent> <buffer> <localleader>d :JavaDocSearch -x declarations<CR>
autocmd FileType java nnoremap <silent> <buffer> <localleader>s :JavaSearchContext<CR>
autocmd FileType java nnoremap <silent> <buffer> <localleader>q :JavaCorrect<CR>
autocmd FileType java nnoremap <silent> <buffer> <leader>i :JavaFormat<CR>
autocmd FileType java nnoremap <silent> <buffer> <leader>I :%JavaFormat<CR>
autocmd FileType java nnoremap <silent> <buffer> <localleader>h :JavaHierarchy<CR>
autocmd FileType java nnoremap <silent> <buffer> <localleader>c :JavaCallHierarchy<CR>
autocmd FileType java nnoremap <buffer> <localleader>rr :JavaRename<space>
autocmd FileType java nnoremap <buffer> <localleader>rm :JavaMove<space>
autocmd FileType java nnoremap <silent> <buffer> <localleader>ru :RefactorUndo<CR>

let mapleader = ','

"Filetype stuff and pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

"plugin settings
	" snipMate
let g:snips_author = 'Chad G. Hansen (chadgh)'

	" vimlist
let g:vimlist_dir = '~/Dropbox/todolists'
let g:vimlist_autocommands = 0
"List highlighting for done and inprogress tags
hi bcDoneLine ctermfg=234
hi bcInProgressLine ctermfg=107
hi bcTag ctermfg=16 

let m = matchadd("bcDoneLine", "^[*-].*@done.*$")
let m = matchadd("bcInProgressLine", "^[*-].*@inprogress.*$")
let m = matchadd("bcTag", "@done")
let m = matchadd("bcTag", "@inprogress")

	" vim-indent-guides
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

	"Buffergator seetings
let g:buffergator_viewport_split_policy='L'
let g:buffergator_autoexpand_on_split=0

"syntax highlighting - yes please
syntax on

"not compatible with vi
set nocompatible

"no beeping
set noerrorbells novisualbell
autocmd VimEnter * set vb t_vb=

"I don't use modelines, so shut them off
set modelines=0

"set up tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab "keep as tabs - not spaces | tabs rule, spaces drool! at least by default

"use utf-8 for encoding
set encoding=utf-8

"three lines from the top or bottom while scrolling
set scrolloff=3

"indenting
set autoindent
set smartindent

" enable mouse
set mouse=a

set pastetoggle=<F2>

"makes hidden buffers easier to create
set hidden

"change the title to include the current file
set icon
auto BufEnter * let &iconstring = "vim " . expand("%:t")

"allows for split windows to say the size I set them
set noequalalways

"fast terminal connection - sends more characters at a time
set ttyfast

"status bar (everything else handled by powerline plugin)
set laststatus=2 "Always show a status line

"turns on the cursorline by default
set cursorline
"turn wrapping on by default
set wrap
"turn on nice line breaking
set lbr
"use ellipsis to indicate a line break
set showbreak=…

"turns on auto completion in command mode
set wildmenu
set wildmode=full

"turn on status line with cursors current position
set ruler

"makes backspace work as expected for tabs and such
set backspace=start,indent,eol

"relative numbering by default
if exists("+relativenumber")
	set relativenumber
else
	"line numbering by default
	set number
endif

"keep 100 of the past commands
set history=1000

"tell vim which files to ignore always
set wildignore=*.swp,*.bak,*.pyc

"don't save swap file
set nobackup
set noswapfile

"undo stuff
"location of undo files
if exists("+undodir")
	set undodir=~/.vimundo
	"save an undo file - persistent undo
	set undofile
	"max number of changes that can be undone
	set undolevels=1000
	"undo on reload
	set undoreload=10000
endif

"fix search - normal regex can be used in searching
nnoremap / /\v
vnoremap / /\v

"search with case-sensitivity smartly
"search in all lowercase - search is case-insensitive
"search with one or more uppercase - search is case-sensitive
set ignorecase
set smartcase

"makes all substitutions global - no need to add the 'g' on the end
set gdefault

"work together to highlight and show matches as you type
set incsearch
set showmatch
set hlsearch
noh

"make hitting tab go to the matching bracket
nnoremap <tab> %
vnoremap <tab> %

" automatically change dir to the dir that the currently working file is.
if exists("+autochdir")
	set autochdir
else
	autocmd BufEnter * lcd %:p:h
endif

"characters to use for tabs and eol
set listchars=tab:▸\ ,trail:܀,eol:¬,extends:>,precedes:<

"Appearance
"more colors
set t_Co=256

"use different colorschemes and fonts in gui or terminal
if has("gui_running")
	set guioptions=aiA
	color superman
	"color lucius
	set guifont=monaco\ 10
	set lines=65 columns=84
else
	"colorscheme lucius
	colorscheme superman
endif

" color stuff for vim-list
hi NonText ctermfg=DarkGray guifg=#363946
hi clear SpecialKey
hi link SpecialKey NonText

hi Folded ctermbg=237 ctermfg=74 guibg=#333333 guifg=#a2a2a2

hi VimlistSubItem guifg=#454545
hi VimlistTitle guifg=#564532

"escape for insert mode
inoremap jj <ESC>

"""""""" some helpful abbreviations
"displays the current date
iab <expr> dts strftime("%m/%d/%y")
iab <expr> ymd strftime("%Y-%m-%d")
iab <expr> ymdt strftime("%Y-%m-%d %H:%M")
iab <expr> wc system("wc -w " . shellescape(expand('%')))

""""""" custom commands 
"leader(<space>,b,c,e,ft,l,n,r,s,ve,vs,w,wm,wo)
"clear highlights for a search
nnoremap <silent> <leader><space> :noh<CR>
"toggle cursor line [cursor]
map <silent> <leader>c :set cursorline!<CR>
"toggle displaying newline charaters and tabs [list]
map <silent> <leader>l :set list!<CR>
"toggle line numbering [number]
map <silent> <leader>n :set number!<CR>
"toggle relativenumbering [relativenumber]
map <silent> <leader>r :set relativenumber!<CR>
"toggle spell checking [spelling]
nmap <silent> <leader>s :set spell!<CR>
"open up .vimrc file for editing [vimrc edit]
nmap <leader>ve :tabe $MYVIMRC<CR>
"source vimrc [vimrc source]
nmap <leader>vs :source ~/.vimrc<CR>
"toggle line wrapping [wrap]
map <leader>w :set wrap!<CR>

"commenting
map <C-c>c <leader>c<space>
map <C-c>$ <leader>c$
map <C-c>A <leader>cA 
map <C-c>y <leader>cyp

"open file under cursor in a new tab
map <C-o> <C-w>gf

"easier movement between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"text bubbling
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

"visually select the las edited pasted line
nmap gV `[v`]
vnoremap < <gv
vnoremap > >gv

"json view
nmap <leader>j !!python -c "import sys,json; print(json.dumps(json.loads(sys.stdin.read()), indent=4))"<CR>

"new tab
map <C-t> :tabnew<CR>

"buffergator
map <C-b> :BuffergatorToggle<CR>

"toggle nerd tree
map <C-n> :NERDTreeToggle<CR>
"save session
map <C-s> :mks! ~/.vimsession<CR>

"navigation works on visual lines
map k gk
map j gj

"write files when loose focus
au FocusLost * :wa

"For PHP programming auto stuffs
au! BufNewFile,BufRead *.php set filetype=php.html.javascript.css.sql
au BufNewFile,BufRead *.php set makeprg=php\ -l\ %
au BufNewFile,BufRead *.php set errorformat=%m\ in\ %f\ on\ line\ %l
au BufNewFile,BufRead *.php let php_htmlInStrings=1
au BufNewFile,BufRead *.php let php_sql_query=1
au BufNewFile,BufRead *.php set foldmethod=manual
au BufNewFile,BufRead *.php let g:DisableAutoPHPFolding=1
au BufNewFile,BufRead *.php set comments=sr:/*,mb:*,ex:*/
au BufNewFile,BufRead *.php set fo+=ro
au BufNewFile,BufRead *.php let php_folding=0
"let php_folding=0
source ~/.vim/bundle/phpfolding/phpfolding.vim
au BufNewFile,BufRead *.php map <F5> <Esc>:EnableFastPHPFolds<Cr>
au BufNewFile,BufRead *.php map <F6> <Esc>:EnablePHPFolds<Cr>
au BufNewFile,BufRead *.php map <F7> <Esc>:DisablePHPFolds<Cr>

" For Python programming
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set colorcolumn=80
au BufNewFile,BufRead *.py set nowrap

"Markdown auto stuffs
"treat .text, README, and .md files as mkd files
au! BufNewFile,BufRead *.text  set filetype=mkd
au BufNewFile,BufRead *.text  set nonumber
au BufNewFile,BufRead *.text  set norelativenumber
au BufNewFile,BufRead *.text  set nocursorline
au BufNewFile,BufRead *.text  set ai formatoptions=tcroqn2 comments=n:&gt;

au! BufNewFile,BufRead README  set filetype=mkd
au BufNewFile,BufRead README  set ai formatoptions=tcroqn2 comments=n:&gt;

au! BufNewFile,BufRead *.md  set filetype=mkd
au BufNewFile,BufRead *.md  set ai formatoptions=tcroqn2 comments=n:&gt;

au! BufNewFile,BufRead *.list  set filetype=list
au BufNewFile,BufRead *.list   set ai formatoptions=cro comments=b:*
au BufNewFile,BufRead *.list  set nonumber
au BufNewFile,BufRead *.list  set norelativenumber
au BufNewFile,BufRead *.list  set nocursorline
au BufNewFile,BufRead *.list  set nowrap
au BufNewFile,BufRead *.list  normal zM

au BufReadPost fugitive://* set bufhidden=delete

"For HTML programming
au BufNewFile,BufRead *.html map <tab> Vatzf

"commonly mis-typed commands
cabbrev W w
cabbrev Q q
cabbrev E e
cabbrev Tabe tabe


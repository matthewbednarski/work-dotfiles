
set wildmode=longest,list,full
set wildmenu
nnoremap <C-n> :bNext<CR>
nnoremap <C-p> :bPrevious<CR>
nnoremap <F5>  :e<CR> G

"g:my_vim_dir is used elsewhere in my vim configurations
let g:my_vim_dir=expand("$HOME/.vim")

"$HOME/.vim and $HOME/.vim/after are in the &rtp on unix
"But on windows, they need to be added.  
if has("win16") || has("win32") || has("win64") "add g:my_vim_dir to the front of the runtimepath execute "set rtp^=".g:my_vim_dir
	"add g:my_vim_dir\after to the end of the runtimepath
	execute "set rtp+=".g:my_vim_dir."\\after"
	"Note, pathogen#infect() looks for the 'bundle' folder in each path
	"of the &rtp, where the last dir in the '&rtp path' is not 'after'. The
	"<path>\bundle\*\after folders will be added if and only if
	"the corresponding <path>\after folder is in the &rtp before
	"pathogen#infect() is called.  So it is very important to add the above
	"'after' folder.
	"(This applies to vim plugins such as snipmate, tabularize, etc.. that
	" are loaded by pathogen (and perhaps vundle too.))

	" Not necessary, but I like to cleanup &rtp to use \ instead of /
	" when on windows machines
	let &rtp=substitute(&rtp,"[/]","\\","g")

	"On windows, if called from cygwin or msys, the shell needs to be changed 
	"to cmd.exe to work with certain plugins that expect cmd.exe on windows versions   
	"of vim.
	if &shell=~#'bash$'
		set shell=$COMSPEC " sets shell to correct path for cmd.exe
	endif
endif

syntax on
filetype plugin indent on


execute pathogen#infect()

nnoremap F gg=G''zz

set omnifunc=syntaxcomplete#Complete

let g:superTabDefaultCompletionType = "context"

let g:solarized_termtrans=1
let g:solarized_termcolors=16
let g:solarized_contrast="high"
let g:solarized_visibility="high"

let g:syntastic_json_checkers = ['jshint']

set t_Co=256
set background=dark " dark | light "
if has('gui_running')
	set guioptions-=m
	set guioptions-=T
end
colorschem solarized
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

let mapleader=","
inoremap jj <ESC>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
let g:xml_syntax_folding=1
"au FileType xml setlocal foldmethod=syntax

set nowrap
set tabstop=4
"set clipboard=unnamed
set clipboard=unnamedplus
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftwidth=4
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch

set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set nobackup
set noswapfile
set mouse=a

cmap w!! w !sudo tee % >/dev/null

call togglebg#map("<F6>")

nnoremap <F3> :set hlsearch!<CR>

autocmd FileType json noremap <buffer>  <c-f> :call JsonBeautify()<cr>
autocmd FileType json noremap <buffer>  <c-f> :call JsonBeautify()<cr>

autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
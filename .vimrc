"load local vimrc
set exrc secure
"######################
"#		 plugins	  #
"######################

"airline
let g:airline_powerline_fonts = 1

"ranger
let g:ranger_open_new_tab = 1
let g:ranger_map_keys = 0

"######################
"#		 work		  #
"######################

set copyindent
set clipboard=unnamed

au BufRead,BufNewFile *.asm set filetype=nasm
au BufRead,BufNewFile *.nix set filetype=yaml
au BufRead,BufNewFile *.pp	set filetype=puppet

"######################
"#		 personal	  #
"######################

"writing
set spell spelllang=en_us

"general
set backspace=indent,eol,start
set nocompatible
set encoding=utf-8
filetype on
filetype plugin indent on
let &path.="/src/include"
set lazyredraw
set ttyfast

"colors
set t_Co=256
colorscheme gruvbox
set background=dark
syntax on
set number

"hilight tabs
set list listchars=tab:\|·,trail:·
set autoindent smartindent

"filetype detection
function Set_sw(index, length)
	if a:index<0
		let sw=4
	elseif a:index>=0 && a:index<a:length
		let sw=2
	endif

	execute "set tabstop=".sw
	execute "set softtabstop=".sw
	execute "set shiftwidth=".sw
	"is needed because NERDTREE will set modifiable off so everytime you open
	"a new tab from NERDTREE an error ocours
	set modifiable
	if a:index==3
		set expandtab colorcolumn=81 textwidth=80 | retab.sw
	else
		set noexpandtab expandtab noexpandtab colorcolumn=81 textwidth=80 |
			\ retab!sw
	endif
endfunction

let blacklist = ['html', 'css', 'json', 'yaml', 'cpp']
au BufRead,BufNewFile,BufNew *
	\ call Set_sw(index(blacklist, &ft), len(blacklist))

"splitting
set splitbelow splitright

"keymappings
let mapleader = "\<Space>"
inoremap jk <ESC>
map <Leader>f :Ranger<CR>
map <S-u> :redo<CR>
nnoremap <F2> :make!<cr>
nnoremap <F3> :make! clean<cr>

nnoremap gf <C-W>gf
vnoremap gf <C-W>gf
nnoremap <Leader>t :tabnew 

"save file as root
cmap w!! w !sudo tee % >/dev/null

"split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <Leader>h :split<CR>
map <Leader>v :vsplit<CR>

"incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

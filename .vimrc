"load local vimrc
set exrc secure
"######################
"#		 plugins	  #
"######################

"ultisnips
let g:UltiSnipsSnippetDirectories=["UltiSnips", "vim-snippets"]
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

inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>"
	\ : "\<CR>"

"YouCompleteMe
set completeopt-=preview
let g:ycm_python_binary_path = 'python'
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

"ranger
let g:ranger_open_new_tab = 1
let g:ranger_map_keys = 0

"CtrlP
let g:ctrlp_map = '<Leader>ll'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['makefile']
let g:ctrlp_prompt_mappings = {
	\ 'AcceptSelection("e")': ['<c-t>'],
	\ 'AcceptSelection("t")': ['<cr>'],
	\ }

"######################
"#		 personal	  #
"######################

"general
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
set number cursorline cursorcolumn

"hilight tabs
set list listchars=tab:\|·,trail:·
set autoindent smartindent

"filetype detection
function Set_sw(index, length)
	if a:index < 0
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
	set noexpandtab expandtab noexpandtab colorcolumn=81 textwidth=80 | retab!sw
endfunction

let blacklist = ['html', 'css', 'json', 'yaml', 'cpp']
au BufRead,BufNewFile,BufNew * 
	\ call Set_sw(index(blacklist, &ft), len(blacklist))

"splitting
set splitbelow splitright

"keymappings
let mapleader = "\<Space>"
inoremap jk <ESC>
map <Leader><Space> :NERDTreeToggle<CR>
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

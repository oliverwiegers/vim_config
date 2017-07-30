"######################
"#		 plugins	  #
"######################

"statusline
set rtp+=$PREFIX/lib/python3.6/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

"nerdtree
let NERDTreeShowHidden=1

"nerd tree highlight
let g:NERDTreeFileExtensionHighlightFullName = 1 
let g:NERDTreeExactMatchHighlightFullName = 1 
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeHighlightFolders = 1 
let g:NERDTreeHighlightFoldersFullName = 1

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
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>" 

"YouCompleteMe
set completeopt-=preview
let g:ycm_python_binary_path = 'python'

"ranger
let g:ranger_open_new_tab = 1
let g:ranger_map_keys = 0

"######################
"#		 personal	  #
"######################

"general
set nocompatible
set encoding=utf-8
filetype on
filetype plugin indent on

"colors
colorscheme angr
syntax on
set number
set cursorcolumn
set cursorline
hi LineNr ctermfg=lightgrey ctermbg=black
hi CursorLine term=bold cterm=bold

"hilight tabs
let blacklist = ['html', 'css', 'json', 'yaml']
autocmd Filetype * if index(blacklist, &ft) < 0 | set tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype * if index(blacklist, &ft) < 0 | set noexpandtab | retab! 4
autocmd Filetype * if index(blacklist, &ft) < 0 | set expandtab | retab! 4
autocmd Filetype * if index(blacklist, &ft) < 0 | set noexpandtab | retab! 4


autocmd Filetype html setlocal expandtab softtabstop=2 shiftwidth=2 tabstop=2
autocmd Filetype html retab

autocmd Filetype css setlocal expandtab softtabstop=2 shiftwidth=2 tabstop=2
autocmd Filetype css retab

autocmd Filetype json setlocal expandtab softtabstop=2 shiftwidth=2 tabstop=2
autocmd Filetype json retab

autocmd Filetype yaml setlocal expandtab softtabstop=2 shiftwidth=2 tabstop=2
autocmd Filetype yaml retab

"markdown
au BufRead,BufNewFile *.md set filetype=markdown

"splitting
set splitbelow
set splitright

"python
au BufRead,BufNewFile *.py set colorcolumn=79
au BufRead,BufNewFile *.py set textwidth=79
"highlight ColorColumn

"html
au BufRead,BufNewFile *.html set colorcolumn=79


"keymappings
let mapleader = "\<Space>"
inoremap jk <ESC>
map <Leader>m :NERDTreeToggle<CR>
map <Leader>f :Ranger<CR>

"save file as root
cmap w!! w !sudo tee % >/dev/null

"disable arrow keys
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>

"split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Swap top/bottom or left/right split
noremap Ctrl+W R
"Break out current window into a new tabview
noremap Ctrl+W T
"Close every window in the current tabview but the current one
noremap Ctrl+W o
"Normalize all split sizes, which is very handy when resizing terminal
noremap ctrl + w =
